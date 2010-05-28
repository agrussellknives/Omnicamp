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
#import "RegexKitLite.h"
#import "ActiveSupportInflector.h"
#import "OCApp.h"


@implementation OCCommunicator

@synthesize userName;
@synthesize passWord;
@synthesize useScripting;
@synthesize trackTime;
@synthesize notifyAssignees;
@synthesize basecampURL;

@synthesize inProcess;
@synthesize numberOfElements;
@synthesize percentComplete;
@synthesize inDeterminate;
@synthesize inAnimate;

-(id)init {
	if(self = [super init]) {
		requestTemplate = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@""]];
		requestHistory = [[NSMapTable alloc] 
			initWithKeyOptions:NSPointerFunctionsStrongMemory|NSPointerFunctionsObjectPersonality
			valueOptions:NSPointerFunctionsStrongMemory|NSPointerFunctionsObjectPersonality
			capacity:2];
		requestor = [OCThrottledRequestor sharedThrottledRequestor];
		inProcess = 0;
		numberOfElements = 0;
		percentComplete = 0;
		inDeterminate = 0;
		inAnimate = 0;
	}
	return self;
}

-(void)dealloc {
	[OmniPlanParser release];
	[super dealloc];
}


-(void)updateRequestTemplate {
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

-(void)incrementDone {
	numberDone++;
	[self setPercentComplete:(numberDone/[self numberOfElements])*100];
}


-(BOOL)postToBasecamp:(NSString *)filePath error:(NSError **)error {
	NSProgressIndicator *pi = [theApp progress];
	[pi setHidden:NO];
	[pi setUsesThreadedAnimation:YES];
	[pi setIndeterminate:YES];
	[pi startAnimation:self];
	
		
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
	// [bcDictionary writeToFile:@"/Users/stephenp/Desktop/bcdict.plist" atomically:YES];
	NSLog(@"%@",bcDictionary);
	[pi setIndeterminate:NO];
	[pi setDoubleValue:[self percentComplete]];
													
	
	// do milestones first...
	
	NSArray *milestones = [bcDictionary objectForKey:@"milestones"];
	NSMutableDictionary *milestone;
	for(milestone in milestones) {
		NSMutableURLRequest *req = [requestTemplate mutableCopy];
		[req setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/projects/%@/milestones/create",basecampURL,[bcDictionary objectForKey:@"project-id"]]]];
		NSXMLElement *request = [NSXMLElement elementWithName:@"request"];
		NSXMLDocument *msDoc = [NSXMLDocument documentWithRootElement:request];
		NSXMLElement *msEl = [milestone serializeToXMLFragmentUsingTagName:@"milestone"];
		[request setChildren:[NSArray arrayWithObject:msEl]];
		[req setHTTPBody:[msDoc XMLData]];
		[milestone setObject:[NSNumber numberWithInt:201] forKey:@"expect"];
		[milestone setObject:@"milestone" forKey:@"type"];
		[requestHistory setObject:milestone forKey:req];
		[requestor addRequestToQueue:req withOwner:self];
	}
	[requestor startQueue];
	
	[bcDictionary removeAllObjects];
	return YES;
}

/*
-(BOOL)postObjectsMatching:(NSString *)xPath enclosingIn:(NSXMLElement *)xmlEnclosure toURL:(NSURL *)url expectingResponse:(int)response onSuccessInvoke:(NSInvocation *)invocation {
	NSError *error = nil;
	NSArray *xmlElements = [bcXML nodesForXPath:xpath error:&error];
	NSXMLElement *xmlElement;
	for(xmlElement in xmlElements) {
		NSXMLDocument *postDoc;
		if(enclosingIn) {
			postDoc = [NSXMLDocument documentWithRootElement:enclosingIn];
			[postDoc setChildren:[NSArray arrayWithObject:xmlElement]];
		}
		else {
			postDoc = [NSXMLDocument documentWithRootElement:xmlElement];
		}
		NSString *newXPath = [xmlElement XPath];
		[requestHistory
	}
}
	
-(BOOL)postObjectsMatching:(NSString *)xPath toURL:(NSURL *)url expectingResponse:(int)response onSuccessInvoke:(NSInvocation *)invocation {
	return [self postObjectsMatching:xpath toURL:url enclosingIn:nil expectingResponse:response onSuccessInvoke:invocation]; 
}

// -(void)updateObjectsMatching:(NSString *)xPath under:(NSXMLNode *)node usingXPathFromResponse:(NSString *)xPath
*/
-(void)postTodosForMilestone:(NSArray *)todos {
	NSMutableDictionary *todo;
	for(todo in todos) {
		NSMutableURLRequest *req = [requestTemplate mutableCopy];
		[req setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/projects/%@/todo-lists.xml",basecampURL,[bcDictionary objectForKey:@"project-id"]]]];
		NSXMLDocument *todoDoc = [todo serializeToXMLWithRootNamed:@"todo-list"];
		[req setHTTPBody:[todoDoc XMLData]];
		[todo setObject:[NSNumber numberWithInt:201] forKey:@"expect"];
		[todo setObject:@"todo-list" forKey:@"type"];
		[requestHistory setObject:todo forKey:req];
		[requestor addRequestToQueue:req withOwner:self];
	}
}
-(void)postTodoItemsForList:(NSMutableDictionary *)todo_list {
	NSMutableDictionary *todo_item;
	for(todo_item in todo_list) {
		NSMutableURLRequest *req = [requestTemplate mutableCopy];
		[req setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/todo-lists/%@/todo-items.xml",basecampURL,[todo_list objectForKey:@"id"]]]];
		NSXMLDocument *todoItemDoc = [todo_item serializeToXMLWithRootNamed:@"todo-item"];
		[req setHTTPBody:[todoItemDoc XMLData]];
		[todo_item setObject:[NSNumber numberWithInt:201] forKey:@"expect"];
		[todo_item setObject:@"todo-item" forKey:@"type"];
		[requestHistory setObject:todo_item forKey:req];
		[requestor addRequestToQueue:req withOwner:self];
	}
}

-(void)handleUnexpectedResponse:(NSHTTPURLResponse *)response forRequest:(NSURLRequest *)req {
	switch([response statusCode]) {
		case 404:
			[requestor clearAndStopQueue];
			/* this error cannot be recovered */
			NSRunAlertPanel(@"Basecamp 404 Error", @"Basecamp returned a 404.  Are you sure you typed your URL in correctly?",
				nil, nil, nil);
			break;
		case 401:
			[requestor clearAndStopQueue];
			NSRunAlertPanel(@"Basecamp Authentication Error", @"Basecamp couldn't log you in, did you type your user name and password correctly?",
				nil, nil, nil);

			break;
		case 503:
			NSLog(@"Basecamp delay.");
			double delay_by = 20;
			[[NSScanner scannerWithString:[[response allHeaderFields] objectForKey:@"Retry-After"]] scanDouble:&delay_by];
			[requestor stopQueue];
			[requestor resumeAfter:delay_by * 1.5]; // wait 50% too long just o be on the safe side
			[requestor addRequestToQueue:req withOwner:self];
			break;
		case 302:
			[self setBasecampURL:[[response allHeaderFields] objectForKey:@"Location"]];
			[requestor addRequestToQueue:req];
			break;
		case 400:
			[requestor clearAndStopQueue];
			[NSException raise:@"Malformed Request" format:@"%@ not a good request",req];
		default:
			[requestor clearAndStopQueue];
			NSRunAlertPanel(@"Basecamp Error", 
			[NSString stringWithFormat:@"Basecamp returned a status code indicating an error, but we're not 100% sure what happened."
			"The error status was: %d\n"
			"Reponse headers were: %@",
			[response statusCode],[response allHeaderFields]],
			nil, nil, nil);
	}
}
			


-(void)processData:(NSData *)data forRequest:(NSURLRequest *)req {
	NSLog(@"receiving data for %@",req);
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
			[self incrementDone];
		}
		else if([[obj objectForKey:@"type"] isEqualToString:@"todo-list"]) {
			//todolist path
			[self postTodoItemsForList:obj];
			[self incrementDone];
		}
		else if([[obj objectForKey:@"type"] isEqualToString:@"todo-item"]) {
			// hey it's a leaf node, nothing to do just yet
			[self incrementDone];
		}
	}
}
-(void)processResponse:(NSHTTPURLResponse *)response forRequest:(NSURLRequest *)req {
	// retrieve our object
	NSLog(@"receiving response for %@",req);
	NSLog(@"request sent was %@",[[[NSString alloc] initWithData:[req HTTPBody] encoding:NSASCIIStringEncoding] autorelease]);
	NSMutableDictionary *obj = [requestHistory objectForKey:req];
	if(([response statusCode] == [[obj objectForKey:@"expect"] intValue])) {
		[obj setObject:@"ok" forKey:@"expect"];
		ActiveSupportInflector *aci = [ActiveSupportInflector sharedActiveSupportInflector];
		NSString *pluralType = [aci pluralize:[obj objectForKey:@"type"]];
		NSString *location = [[response allHeaderFields] objectForKey:@"Location"];
		NSString *locationRegex = [NSString stringWithFormat:@".*?%@\\/(\\d*)",pluralType];
		NSString *newId = [[location captureComponentsMatchedByRegex:locationRegex] objectAtIndex:0];
		[obj setObject:newId forKey:@"id"];
	}
	else {
		[self handleUnexpectedResponse:response forRequest:req];
	}
}

@end
