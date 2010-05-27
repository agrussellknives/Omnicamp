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


@implementation OCCommunicator

@synthesize userName;
@synthesize passWord;
@synthesize useScripting;
@synthesize trackTime;
@synthesize notifyAssignees;
@synthesize basecampURL;

-(id)init {
	if(self = [super init]) {
		requestTemplate = [[NSMutableURLRequest alloc] init];
		requestHistory = [[NSMutableDictionary alloc] init];
		requestor = [OCThrottledRequestor sharedThrottledRequestor];
		[self addObserver:self forKeyPath:@"userName" options:NSKeyValueObservingOptionNew context:nil];
		[self addObserver:self forKeyPath:@"passWord" options:NSKeyValueObservingOptionNew context:nil];
	}
	return self;
}

-(void)dealloc {
	[OmniPlanParser release];
	[super dealloc];
}

- (void)awakeFromNib {
	NSLog(@"communicator awoke");

}

-(void) updateRequestTemplate {
	[requestTemplate setHTTPMethod:@"POST"];
	[requestTemplate setValue:[self authString] forHTTPHeaderField:@"Authorization"];
	[requestTemplate setValue:@"application/xml" forHTTPHeaderField:@"Accept"];
	[requestTemplate setValue:@"application/xml" forHTTPHeaderField:@"Content-Type"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
	if([keyPath isEqualToString:@"userName"] || [keyPath isEqualToString:@"passWord"]) {
		[self updateRequestTemplate];
	}
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

-(void)updateMilestoneDependenciesGivenMilestoneIds:(NSXMLDocument *)milestoneData {
	
}

-(void)uploadMilestones:(NSDictionary *)bcDictionary {
	NSArray *newMilestones = [[bcDictionary objectForKey:@"milestones"] filteredArrayUsingPredicate:
								[NSPredicate predicateWithFormat:@"SELF.basecampID == NIL"]];
	NSXMLDocument *milestones = [newMilestones serializeToXMLWithRootNamed:@"request"];
	NSMutableURLRequest *req = [[requestTemplate copy] autorelease];
	[req setHTTPBody:[milestones XMLData]];
	[requestHistory setObject:req forKey:@"uploadMilestones"];
	[requestor addRequestToQueue:req];
}



-(BOOL)postToBasecamp:(NSString *)filePath error:(NSError **)error {
	NSMutableDictionary *bcDictionary;
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
	[bcDictionary writeToFile:@"/Users/stephenp/Desktop/bcdict.plist" atomically:YES];
	NSLog(@"%@",bcDictionary);
	
	NSMutableArray *invocationList;
	/* get all milestones that aren't linked to basecamp miletones */
	
	/* when it's completed we want to */
	NSInvocation *currentInvocation;
	[[NSInvocation invocationWithTarget:self invocationOut:&currentInvocation]
		uploadMilestones:bcDictionary];
		
	[currentInvocation invoke];
															
	
	/* // do milestones first...
	NSXMLDocument *milestones = [[bcDictionary objectForKey:@"milestones"] serializeToXMLWithRootNamed:@"request"];
	NSMutableURLRequest *req = [requestTemplate copy];]
	[req setHTTPBody:[milestones XMLData]];
	[requestor addRequestToQueue:req];
	*/
	return NO;
}

-(void)processData:(NSData *)data forRequest:(NSURLRequest *)req {
	NSLog(@"%@",[[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease]);
}
-(void)processResponse:(NSHTTPURLResponse *)response forRequest:(NSURLRequest *)req {
	NSLog(@"%@",response);
}

@end
