//
//  OCCommunicator.m
//  OmniCamp
//
//  Created by Stephen Prater on 5/24/10.
//  Copyright 2010 A. G. Russell Knives. All rights reserved.
//

#import "OCCommunicator.h"
#import "NSData+Base64.h"
#import "NSArray+AtIndexOrNil.h"
#import "NSArray+maximumValue.h"
#import "NSDictionary+serializeToXML.h"
#import "OPGlue/OPGlue.h"
#import "objc/runtime.h"
#import "OmniplanParsing.h"
#import "OCDependentParser.h"
#import "OCIndependentParser.h"
#import "NSInvocation(ForwardedConstruction).h"
#import "OCUploadPlan.h"
#import "OCUploadStep.h"
#import "OCUploadOperation.h"


@implementation OCCommunicator

@synthesize userName;
@synthesize passWord;
@synthesize useScripting;
@synthesize trackTime;
@synthesize notifyAssignees;
@synthesize basecampURL;

-(id)init {
	if(self = [super init]) {
		requestTemplate = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@""]];
		requestHistory = [[NSMutableDictionary alloc] initWithCapacity:2];
		requestor = [OCThrottledRequestor sharedThrottledRequestor];
	}
	return self;
}

-(void)dealloc {
	[OmniPlanParser release];
	[super dealloc];
}


-(void) updateRequestTemplate {
	[requestTemplate setHTTPMethod:@"POST"];
	[requestTemplate setURL:[NSURL URLWithString:basecampURL]];
	[requestTemplate setValue:[self authString] forHTTPHeaderField:@"Authorization"];
	[requestTemplate setValue:@"application/xml" forHTTPHeaderField:@"Accept"];
	[requestTemplate setValue:@"application/xml" forHTTPHeaderField:@"Content-Type"];
}

- (void)awakeFromNib {
	NSLog(@"communicator awoke");
}

-(void) updateParser {
	if(OmniPlanParser) {
		// release our current parser if we have one
		[OmniPlanParser release];
	}
		
	if(useScripting) {
		OmniPlanParser = [[OCDependentParser alloc] init];
	}
	else {
		OmniPlanParser = [[OCIndependentParser alloc] init];
	}
	[OmniPlanParser setCommunicator:self];
}
	
-(void)setBasecampURL:(NSString *)aString {
	[basecampURL release];
	basecampURL = [aString copy];
	[self updateRequestTemplate];
}

-(void)setUseScripting:(int)use {
	useScripting = use;
	[self updateParser];
}

-(NSString *)authString {
	NSData *tempData = [[NSString stringWithFormat:@"%@:%@",userName,passWord] dataUsingEncoding:NSASCIIStringEncoding];
	return [NSString stringWithFormat:@"BASIC %@",[tempData base64EncodedString]];
}


-(NSString *)filePath {
	return [OmniPlanParser filePath];
}

-(void)setFilePath:(NSString *)thePath {
	[OmniPlanParser setFilePath:thePath];
}


-(BOOL)postToBasecamp:(NSString *)filePath error:(NSError **)error {
	[self setFilePath:filePath];
	
	if(useScripting) {
		bcDictionary = [OmniPlanParser decodeOmniPlan:filePath];
	}
	else {
		NSRunAlertPanel(@"Independent Parsing not implemented",
		@"Independent analysis and posting of Omniplan Project files is not fully implemented."
		"The routine will run and output info the console, but no data will be posted.  You may"
		"experience errors, including crashes!", nil, nil, nil);
		bcDictionary = [OmniPlanParser decodeOmniPlan:filePath];
		return NO;
	}
	[bcDictionary retain];
	[bcDictionary writeToFile:@"/Users/stephenp/Desktop/bcdict.plist" atomically:YES];
	NSLog(@"%@",bcDictionary);
	
													
	
	// do milestones first...
	[requestTemplate setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/projects/%@",basecampURL,[bcDictionary objectForKey:@"project-id"]]]];
	
	NSArray *milestones = [bcDictionary objectForKey:@"milestones"];
	NSMutableDictionary *milestone;
	for(milestone in milestones) {
		NSMutableURLRequest *req = [requestTemplate mutableCopy];
		NSXMLDocument *msDoc = [NSXMLDocument documentWithRootElement:[NSXMLElement elementWithName:@"request"]];
		NSXMLElement *msEl = [milestone serializeToXMLFragmentUsingTagName:@"milestone"];
		[msDoc setChildren:[NSArray arrayWithObject:msEl]];
		[req setHTTPBody:[msDoc XMLData]];
		[milestone setObject:[NSNumber numberWithInt:201] forKey:@"expect"];
		[milestone setObject:@"milestone" forKey:@"type"];
		[requestHistory setObject:milestone forKey:req];
		[requestor addRequestToQueue:req withOwner:self];
	}
	[requestor startQueue];
			
	return YES;
}



-(void)processData:(NSData *)data forRequest:(NSURLRequest *)req {
	NSMutableDictionary *obj = [requestHistory objectForKey:req];
	NSError *error = nil;
	if([[obj objectForKey:@"expect"] isEqualToString:@"ok"]) {
		if([[obj objectForKey:@"type"] isEqualToString:@"milestone"]) {
			// milestone path
			NSXMLDocument *msRDoc = [[NSXMLDocument alloc] initWithData:data options:0 error:&error];
			NSXMLNode *bcId = [[msRDoc nodesForXPath:@"id" error:&error] objectAtIndex:0];
			NSMutableDictionary *todo_list;
			NSArray *dpTodos = [[bcDictionary objectForKey:@"todo-lists"] filteredArrayUsingPredicate:
				[NSPredicate predicateWithFormat:@"SELF.milestone-id == %@",[bcId stringValue]]];
			for(todo_list in dpTodos) {
				[todo_list setObject:[bcId stringValue] forKey:@"milestone-id"];
			}
			[self postTodosForMilestone:dpTodos];
		}
	}
}
-(void)processResponse:(NSHTTPURLResponse *)response forRequest:(NSURLRequest *)req {
	// retrieve our object
	NSMutableDictionary *obj = [requestHistory objectForKey:req];
	if(!([response statusCode] == [[obj objectForKey:@"expect"] intValue])) {
		[obj setObject:@"ok" forKey:@"expect"];
	}
}

@end
