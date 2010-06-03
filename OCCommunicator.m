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
#import "RegexKitLite.h"
#import "ActiveSupportInflector.h"
#import "OCApp.h"

@interface OCCommunicator (Private) 
-(void)postTodosForMilestone:(NSArray *)todos;
-(void)processResponse:(NSHTTPURLResponse *)response forRequest:(NSURLRequest *)req;
-(void)postTodoItemsForList:(NSMutableDictionary *)todo_list;
-(void)processData:(NSData *)data forRequest:(NSURLRequest *)req;
-(void)handleUnexpectedResponse:(NSHTTPURLResponse *)response forRequest:(NSURLRequest *)req;
-(void)postMilestones:(NSArray *)milestones;
-(void)cleanUp;
@end;

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
@synthesize statusMessage;

-(id)init {
	if(self = [super init]) {
		requestTemplate = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@""]];
		requestHistory = [[NSMapTable alloc] 
			initWithKeyOptions:NSPointerFunctionsStrongMemory|NSPointerFunctionsObjectPointerPersonality
			valueOptions:NSPointerFunctionsStrongMemory|NSPointerFunctionsObjectPointerPersonality
			capacity:2];
		requestor = [OCThrottledRequestor sharedThrottledRequestor];
		[requestor setDelegate:self];
		[self setStatusMessage:@"Drop Omniplan file here to Sync."];
		inProcess = 0;
		numberOfElements = 0;
		percentComplete = 0;
		inDeterminate = 0;
		inAnimate = 0;
		numberDone = 0;
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
	[requestTemplate setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
}

- (void)awakeFromNib {
	//NSLog(@"communicator awoke");
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
	[self setPercentComplete:((double)numberDone/[self numberOfElements])*100];
	NSProgressIndicator *pi = [theApp progress];
	[pi setDoubleValue:[self percentComplete]];
}


-(BOOL)postToBasecamp:(NSString *)filePath error:(NSError **)error {
	NSProgressIndicator *pi = [theApp progress];
	[pi setHidden:NO];
	[pi setUsesThreadedAnimation:YES];
	[pi setIndeterminate:YES];
	[pi startAnimation:self];
	[self setStatusMessage:@"Getting information from Omniplan"];
	[[theApp statusMessage] display]; // because kvo notifications don't get posted until it returns to the run loop.
	
		
	if(useScripting) {
		bcDictionary = [[OmniPlanParser decodeOmniPlan:filePath] retain];
	}
	else {
		NSRunAlertPanel(@"Independent Parsing not implemented",
		@"Independent analysis and posting of Omniplan Project files is not fully implemented."
		"The routine will run and output info the console, but no data will be posted.  You may"
		"experience errors, including crashes!", nil, nil, nil);
		bcDictionary = [[OmniPlanParser decodeOmniPlan:filePath] retain];
		return NO;
	}
	
	[self setNumberOfElements:[[bcDictionary objectForKey:@"task-count"] intValue]];
	// [bcDictionary writeToFile:@"/Users/stephenp/Desktop/bcdict.plist" atomically:YES];
	[pi setIndeterminate:NO];
	[pi setDoubleValue:[self percentComplete]];
													
	// post the "general tasks" first
	[self setStatusMessage:@"Posting information to Basecamp"];
	
	NSArray *generalTasks = [[bcDictionary objectForKey:@"todo-lists"] filteredArrayUsingPredicate:
		[NSPredicate predicateWithFormat:@"objectId == -1 && id != NULL"]];
	[self postTodosForMilestone:generalTasks];
	
	
	// do milestones second...
		
	NSArray *milestones = [bcDictionary objectForKey:@"milestones"];
	[self postMilestones:milestones];
	
	
	[requestor startQueue];
	
	return YES; 
}

-(void)postMilestones:(NSArray *)milestones {
	NSEnumerator *reverseMilestones = [milestones reverseObjectEnumerator];
	NSArray *doNotXML = [NSArray arrayWithObject:@"objectId"];
	NSMutableDictionary *milestone;
	for(milestone in reverseMilestones) {
		NSMutableURLRequest *req = [requestTemplate mutableCopy];
		[req setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/projects/%@/milestones/create",basecampURL,[bcDictionary objectForKey:@"project-id"]]]];
		NSXMLElement *request = [NSXMLElement elementWithName:@"request"];
		NSXMLDocument *msDoc = [NSXMLDocument documentWithRootElement:request];
		NSXMLElement *msEl = [milestone serializeToXMLFragmentUsingTagName:@"milestone" excluding:doNotXML];
		[request setChildren:[NSArray arrayWithObject:msEl]];
		[req setHTTPBody:[msDoc XMLData]];
		[milestone setObject:[NSNumber numberWithInt:201] forKey:@"expect"];
		[milestone setObject:@"milestone" forKey:@"type"];
		[milestone setObject:@"post" forKey:@"operation"];
		//NSLog(@"%@",requestHistory);
		[requestHistory setObject:milestone forKey:req];
		[requestor addRequestToQueue:req withOwner:self];
		[req release]; //the map will retain it, we release our copy.
	}
}

-(void)postTodosForMilestone:(NSArray *)todos {
	NSArray *doNotXML = [NSArray arrayWithObjects:@"objectId",@"todo-items",nil];
	NSMutableDictionary *todo;
	NSEnumerator *reverse = [todos reverseObjectEnumerator];
	for(todo in reverse) {
		NSMutableURLRequest *req = [requestTemplate mutableCopy];
		[req setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/projects/%@/todo_lists.xml",basecampURL,[bcDictionary objectForKey:@"project-id"]]]];
		NSXMLDocument *todoDoc = [todo serializeToXMLWithRootNamed:@"todo-list" excluding:doNotXML];
		[req setHTTPBody:[todoDoc XMLData]];
		[todo setObject:[NSNumber numberWithInt:201] forKey:@"expect"];
		[todo setObject:@"todo-list" forKey:@"type"];
		[todo setObject:@"post" forKey:@"operation"];
		// as a special case.		
		[requestHistory setObject:todo forKey:req];
		[requestor addRequestToQueue:req withOwner:self];
		[req release];
	}
}
-(void)postTodoItemsForList:(NSMutableDictionary *)todo_list {
	NSArray *doNotXML = [NSArray arrayWithObject:@"objectId"];
	NSMutableDictionary *todo_item;
	NSEnumerator *todolistItemsReverse = [[todo_list objectForKey:@"todo-items"] reverseObjectEnumerator];
	for(todo_item in todolistItemsReverse) {
		NSMutableURLRequest *req = [requestTemplate mutableCopy];
		[req setURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/todo_lists/%@/todo_items.xml",basecampURL,[todo_list objectForKey:@"id"]]]];
		NSXMLDocument *todoItemDoc = [todo_item serializeToXMLWithRootNamed:@"todo-item" excluding:doNotXML];
		[req setHTTPBody:[todoItemDoc XMLData]];
		[todo_item setObject:[NSNumber numberWithInt:201] forKey:@"expect"];
		[todo_item setObject:@"todo-item" forKey:@"type"];
		[todo_item setObject:@"post" forKey:@"operation"];
		[requestHistory setObject:todo_item forKey:req];
		[requestor addRequestToQueue:req withOwner:self];
		[req release];
	}
}

-(void)handleUnexpectedResponse:(NSHTTPURLResponse *)response forRequest:(NSURLRequest *)req {
	//NSLog(@"unexpected response code");
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
	[self cleanUp];
}
			


-(void)processData:(NSData *)data forRequest:(NSURLRequest *)req {
	// NSLog(@"receiving data for %@",req);
	NSMutableDictionary *obj = [requestHistory objectForKey:req];
	NSError *error = nil;
	if([[obj objectForKey:@"expect"] isEqualToString:@"ok"]) {
		if([[obj objectForKey:@"type"] isEqualToString:@"milestone"]) {
			// milestone path
			NSXMLDocument *msRDoc = [[NSXMLDocument alloc] initWithData:data options:0 error:&error];
			// since we only create one milestone at a time, there should only be one of these.
			NSXMLNode *bcId = [[msRDoc nodesForXPath:@"//id" error:&error] objectAtIndex:0];
			NSMutableDictionary *todo_list;
			// create int values for the ids.
			int bcIdInt, objectId;
			[[NSScanner scannerWithString:[bcId stringValue]] scanInt:&bcIdInt];
			objectId = [[obj objectForKey:@"objectId"] intValue];
			// set the basecamp id of our reference object
			[obj setObject:[NSNumber numberWithInt:bcIdInt] forKey:@"id"];
			NSArray *dpTodos = [[bcDictionary objectForKey:@"todo-lists"] filteredArrayUsingPredicate:
				[NSPredicate predicateWithFormat:@"%K == %d OR %K == %d",@"milestone-id",bcIdInt,@"milestone-id",objectId]];
			//NSLog(@"%@",dpTodos);
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
	else {
		NSLog(@"recieved data for request which wasn't honored.");
		NSLog(@"%@",[[[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding] autorelease]);
	}
}
-(void)processResponse:(NSHTTPURLResponse *)response forRequest:(NSURLRequest *)req {
	// retrieve our object
	// NSLog(@"receiving response for %@",req);
	//NSLog(@"request sent was %@",[[[NSString alloc] initWithData:[req HTTPBody] encoding:NSASCIIStringEncoding] autorelease]);
	NSMutableDictionary *obj = [requestHistory objectForKey:req];
	if(([response statusCode] == [[obj objectForKey:@"expect"] intValue])) {
		[obj setObject:@"ok" forKey:@"expect"];
		// milestones return created object data in DATA rather than in the location.
		// PITA.
		if(![[obj objectForKey:@"type"] isEqualToString:@"milestone"]) {
			ActiveSupportInflector *aci = [ActiveSupportInflector sharedActiveSupportInflector];
			NSString *pluralTypeURL = [[aci pluralize:[obj objectForKey:@"type"]] 
				stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
			NSString *location = [[response allHeaderFields] objectForKey:@"Location"];
			NSString *locationRegex = [NSString stringWithFormat:@".*?%@\\/(\\d*)",pluralTypeURL];
			// the first location is the entire string...
			NSString *newId = [[location captureComponentsMatchedByRegex:locationRegex] objectAtIndex:1];
			[obj setObject:newId forKey:@"id"];
		}
	}
	else {
		[self handleUnexpectedResponse:response forRequest:req];
	}
}

-(void)cleanUp {
	NSLog(@"cleaning up self");
	[self setStatusMessage:@"Drop Omniplan File here to Sync"];
	[bcDictionary removeAllObjects];
	[bcDictionary release];
	[self setPercentComplete:100];
	[[theApp progress] setDoubleValue:[self percentComplete]];
	[[theApp progress] setHidden:YES];
	[self setPercentComplete:0.0];
	numberDone = 0;
}

-(void)throttledRequestorDidEmptyQueue:(OCThrottledRequestor *)requestor {
	NSLog(@"queue was emptied");
	// now we want to push the ids back to Omniplan throught the dependent parser
	[self setStatusMessage:@"Pusing info into Omniplan"];
	[[theApp statusMessage] display];
	[OmniPlanParser encodeBasecamp:bcDictionary];
	[self cleanUp];
}

@end
