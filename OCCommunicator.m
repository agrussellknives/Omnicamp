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
#import "NSString+stringWithFormatArray.h"
#import "OCApp.h"

@interface OCCommunicator (Private) 
-(void)processResponse:(NSHTTPURLResponse *)response forRequest:(NSURLRequest *)req;
-(void)processData:(NSData *)data forRequest:(NSURLRequest *)req;
-(void)handleUnexpectedResponse:(NSHTTPURLResponse *)response forRequest:(NSURLRequest *)req;
-(void)postType:(NSString *)type withData:(NSArray *)data;
-(void)postType:(NSString *)type withData:(NSArray *)data userInfo:(NSDictionary *)info;
-(void)nextStepFromKey:(NSString *)key;
-(void)cleanUp;
-(void)updateType:(NSString *)type withData:(NSArray *)data userInfo:(NSDictionary *)info;
-(void)urlOp:(NSString *)op withType:(NSString *)type withData:(NSArray *)data userInfo:(NSDictionary *)info;  
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
@synthesize bcDictionary;

@synthesize uploadPlan;


-(id)init {
	if(self = [super init]) {
		requestTemplate = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@""]];
		requestHistory = [[NSMapTable alloc] 
			initWithKeyOptions:NSPointerFunctionsStrongMemory|NSPointerFunctionsObjectPointerPersonality
			valueOptions:NSPointerFunctionsStrongMemory|NSPointerFunctionsObjectPointerPersonality
			capacity:2];
			
		uploadPlan = [[NSDictionary alloc] initWithContentsOfFile:
			[[NSBundle mainBundle] pathForResource:@"upload-plan" ofType:@"plist"]];

		requestor = [OCThrottledRequestor sharedThrottledRequestor];
		[requestor setDelegate:self];
		[self setStatusMessage:@"Drop Omniplan file here to Sync."];
		inProcess = 0;
		numberOfElements = 0;
		percentComplete = 0;
		inDeterminate = 0;
		inAnimate = 0;
		numberDone = 0;
		uploadStep = 0;
		currentStep = nil;
			}
	return self;
}

-(void)dealloc {
	[requestTemplate release];
	[requestHistory release];
	[uploadPlan release];
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
		bcDictionary = [OmniPlanParser decodeOmniPlan:filePath];
		[bcDictionary retain];
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
	
	[pi setIndeterminate:NO];
	[pi setDoubleValue:[self percentComplete]];

	[self setStatusMessage:@"Posting information to Basecamp"];
	

	
	NSArray *generalTasks = [[bcDictionary objectForKey:@"todo-lists"] filteredArrayUsingPredicate:
		[NSPredicate predicateWithFormat:@"objectId == -1"]];
	if([generalTasks count] > 0) {
		[self postType:@"todo-lists" withData:generalTasks];
	}
	
	[self nextStepFromKey:nil];
	
	[requestor startQueue];
	
	return YES; 
}

-(void)nextStepFromKey:(NSString *)key {
	NSArray *stepArray = [[self uploadPlan] objectForKey:@"step-order"];
	NSString *stepKey;
	if(key) {
		stepKey = [stepArray objectAtIndex:([stepArray indexOfObject:key]+1)];
	} else {
		stepKey = [stepArray objectAtIndex:0];
	}
	
	currentStep = [[self uploadPlan] objectForKey:stepKey];
	
	uploadStep++;
	[self postType:stepKey withData:[bcDictionary objectForKey:stepKey]];	
}

-(NSArray *)parseVars:(NSArray *)vars considering:(id)items {
	NSMutableArray *values = [NSMutableArray arrayWithCapacity:[vars count]];
	NSMutableDictionary *allItemValues = [NSMutableDictionary dictionaryWithCapacity:1];
	NSString *kvp;
		
	if([items isKindOfClass:[NSArray class]]) {
		NSDictionary *eachDict;
		for(eachDict in items) {
			[allItemValues addEntriesFromDictionary:eachDict];
		}
	} else if ([items isKindOfClass:[NSDictionary class]]) {
		allItemValues = [NSMutableDictionary dictionaryWithDictionary:items];
	}
		
	for(kvp in vars) {
		NSRange spec;
		spec = [kvp rangeOfString:@"self"];
		if(spec.location == 0) {
			[values addObject:[self valueForKeyPath:[kvp substringFromIndex:spec.length+1]]];
		}
		else {
			[values addObject:[allItemValues valueForKeyPath:kvp]];
		}
	}
	return values;
}




-(void)postType:(NSString *)type withData:(NSArray *)data {
	[self postType:type withData:data userInfo:nil];
}
-(void)postType:(NSString *)type withData:(NSArray *)data userInfo:(NSDictionary *)info {
	[self urlOp:@"new" withType:type withData:data userInfo:info];
	[self updateType:type withData:data userInfo:info];
}
-(void)updateType:(NSString *)type withData:(NSArray *)data userInfo:(NSDictionary *)info {
	[self urlOp:@"update" withType:type withData:data userInfo:info];
}

-(void)urlOp:(NSString *)op withType:(NSString *)type withData:(NSArray *)data userInfo:(NSDictionary *)info {
	// NSLog(@"%@ %@",op,type);
	// predicate array with the qualifiying test.
	currentStep = [[self uploadPlan] objectForKey:type];
	NSMutableDictionary *settingsDict = [NSMutableDictionary dictionaryWithDictionary:
		[[self uploadPlan] valueForKeyPath:[@"default." stringByAppendingString:op]]];
	[settingsDict addEntriesFromDictionary:[currentStep valueForKeyPath:op]];
	
	NSPredicate *qualifiyingTest = [NSPredicate predicateWithFormat:[settingsDict valueForKeyPath:@"qualifyingTest"]];
	data = [data filteredArrayUsingPredicate:qualifiyingTest];
	NSEnumerator *reversedObjects = [data reverseObjectEnumerator];
	NSArray *doNotXML = [NSArray arrayWithArray:[settingsDict valueForKeyPath:@"exclude"]];
	id userInfo;
	NSMutableDictionary *item;
	for(item in reversedObjects) {
		userInfo = info ? [NSArray arrayWithObjects:item,info,nil] : item;
		NSMutableURLRequest *req = [requestTemplate mutableCopy];
		[req setURL:[NSURL URLWithString:
			[NSString stringWithFormat:
				[settingsDict valueForKeyPath:@"url.format"]
				objectValues: [self parseVars:[settingsDict valueForKeyPath:@"url.vars"] considering:userInfo]
			]]];
		NSXMLDocument *itemDoc;
		NSXMLElement *itemEl = [item serializeToXMLFragmentUsingTagName:[settingsDict valueForKeyPath:@"tag"] excluding:doNotXML];
		if([settingsDict valueForKeyPath:@"enclosingTag"]) {
			NSXMLElement *encTag = [NSXMLElement elementWithName:[settingsDict valueForKeyPath:@"enclosingTag"]];
			[encTag setChildren:[NSArray arrayWithObject:itemEl]];
			itemDoc = [NSXMLDocument documentWithRootElement:encTag];
		} else {
			itemDoc = [NSXMLDocument documentWithRootElement:itemEl];
		}
		[req setHTTPBody:[itemDoc XMLData]];
		[req setHTTPMethod:[settingsDict valueForKeyPath:@"operation"]];

		[item setObject:[settingsDict valueForKeyPath:@"expect"] forKey:@"expect"];
		[item setObject:[[ActiveSupportInflector sharedActiveSupportInflector] singularize:type] forKey:@"type"];
		[item setObject:op forKey:@"operation"];

		[requestHistory setObject:item forKey:req];
		[requestor addRequestToQueue:req withOwner:self];
		[req release]; // retained by the map;
	}	
}
		
-(void)handleUnexpectedResponse:(NSHTTPURLResponse *)response forRequest:(NSURLRequest *)req {
	// NSLog(@"unexpected response code");
	switch([response statusCode]) {
		case 404:
			[requestor clearAndStopQueue];
			/* this error cannot be recovered */
			NSRunAlertPanel(@"Basecamp 404 Error", @"Basecamp returned a 404.  Are you sure you typed your URL in correctly?",
				nil, nil, nil);
			[self cleanUp];
			break;
		case 401:
			[requestor clearAndStopQueue];
			NSRunAlertPanel(@"Basecamp Authentication Error", @"Basecamp couldn't log you in, did you type your user name and password correctly?",
				nil, nil, nil);
			[self cleanUp];
			break;
		case 503:
			NSLog(@"Basecamp delay.");
			double delay_by = 20;
			[[NSScanner scannerWithString:[[response allHeaderFields] objectForKey:@"Retry-After"]] scanDouble:&delay_by];
			[requestor stopQueue];
			[requestor resumeAfter:delay_by * 1.5]; // wait 50% too long just o be on the safe side
			[requestor addRequestToQueue:req withOwner:self];
			[self cleanUp];
			break;
		case 302:
			[self setBasecampURL:[[response allHeaderFields] objectForKey:@"Location"]];
			[requestor addRequestToQueue:req];
			[self cleanUp];
			break;
		case 400:
			[requestor clearAndStopQueue];
			[NSException raise:@"Malformed Request" format:@"%@ not a good request",req];
			[self cleanUp];
			break;
		case 500:
			// We want to see the error information for these response, so we'll let the
			// processData function clear and stop the Queue
			NSLog(@"%@",[[[NSString alloc] initWithData:[req HTTPBody] encoding:NSASCIIStringEncoding] autorelease]);
			NSLog(@"%@",[response allHeaderFields]);
			NSRunAlertPanel(@"Sync Error", @"Basecamp returned a 500 error.  Possible causes of this are\n"
				"Basecamp IDs on Unposted Tasks\n"
				"Tasks with identical Basecamp IDs\n", nil, nil, nil);
			break;
		default:
			NSLog(@"%d",[response statusCode]);
			NSLog(@"Offending Request: %@",[[[NSString alloc] initWithData:[req HTTPBody] encoding:NSASCIIStringEncoding] autorelease]);
			NSRunAlertPanel(@"Basecamp Error", @"Basecamp returned a status code indicating an error, but we're not 100%% sure what happened.",
				nil,nil,nil);
	}
}
			


-(void)processData:(NSData *)data forRequest:(NSURLRequest *)req {
	// NSLog(@"receiving data for %@",req);
	NSMutableDictionary *obj = [requestHistory objectForKey:req];
	NSError *error = nil;
	if([[obj objectForKey:@"expect"] isEqualToString:@"ok"]) {
		if([[obj objectForKey:@"type"] isEqualToString:@"milestone"]) {
			int objectId;
			NSString *bcIdInt;
			NSMutableDictionary *todo_list;

			// if it's a newly created item, set the id to the returned basecamp id
			if([[obj objectForKey:@"operation"] isEqualToString:@"new"]) {
				NSXMLDocument *msRDoc = [[NSXMLDocument alloc] initWithData:data options:0 error:&error];
				NSXMLNode *bcId = [[msRDoc nodesForXPath:@"//id" error:&error] objectAtIndex:0];

				objectId = [[obj objectForKey:@"objectId"] intValue];
				bcIdInt = [bcId stringValue];
				// set the basecamp id of our reference object
				[obj setObject:bcIdInt forKey:@"id"];
			}
			else {
				bcIdInt = [obj objectForKey:@"id"];
			}
				
			NSArray *dpTodos = [[bcDictionary objectForKey:@"todo-lists"] filteredArrayUsingPredicate:
				[NSPredicate predicateWithFormat:@"%K == %@ OR %K == %d",@"milestone-id",bcIdInt,@"milestone-id",objectId]];
			for(todo_list in dpTodos) {
				[todo_list setObject:bcIdInt forKey:@"milestone-id"];
			}
			[self postType:@"todo-lists" withData:dpTodos];
			[self incrementDone];
		}
		else if([[obj objectForKey:@"type"] isEqualToString:@"todo-list"]) {
			//todolist path
			[self postType:@"todo-items" withData:[obj objectForKey:@"todo-items"] userInfo:[NSDictionary dictionaryWithObject:obj forKey:@"todo-list"]];
			[self incrementDone];
		}
		else if([[obj objectForKey:@"type"] isEqualToString:@"todo-item"]) {
			// hey it's a leaf node, nothing to do just yet
			[self incrementDone];
		}
	}
	else {
		NSLog(@"recieved data for request which wasn't honored.");
		NSLog(@"%@",[req allHTTPHeaderFields]);
		NSLog(@"%@",[[[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding] autorelease]);
		[requestor clearAndStopQueue];
	}
}
-(void)processResponse:(NSHTTPURLResponse *)response forRequest:(NSURLRequest *)req {
	// retrieve our object
	//NSLog(@"request sent was %@",[[[NSString alloc] initWithData:[req HTTPBody] encoding:NSASCIIStringEncoding] autorelease]);
	NSMutableDictionary *obj = [requestHistory objectForKey:req];
	// nsNSLog(@"recevied %d response for %@ request to %@",[response statusCode],[obj objectForKey:@"operation"],req);
	if(([response statusCode] == [[obj objectForKey:@"expect"] intValue])) {
		[obj setObject:@"ok" forKey:@"expect"];
		// milestones return created object data in DATA rather than in the location.
		if([[obj objectForKey:@"operation"] isEqualToString:@"new"]) {
			// if it's a newly created item, set the id to the returned basecamp id
			if(![[obj objectForKey:@"type"] isEqualToString:@"milestone"]) {
				ActiveSupportInflector *aci = [ActiveSupportInflector sharedActiveSupportInflector];
				NSString *pluralTypeURL = [[aci pluralize:[obj objectForKey:@"type"]] 
					stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
				NSString *location = [[response allHeaderFields] objectForKey:@"Location"];
				NSString *locationRegex = [NSString stringWithFormat:@".*?%@\\/(\\d*)",pluralTypeURL];
				// the first location is the entire string, so use index 1.
				NSString *newId = [[location captureComponentsMatchedByRegex:locationRegex] objectAtIndex:1];
				[obj setObject:newId forKey:@"id"];
			}
		}
	}
	else {
		[obj setObject:@"error" forKey:@"expect"];
		[self handleUnexpectedResponse:response forRequest:req];
	}
}

-(void)cleanUp {
	// NSLog(@"cleaning up self");
	[self setStatusMessage:@"Drop Omniplan File here to Sync"];
	[bcDictionary removeAllObjects];
	[bcDictionary release];
	bcDictionary = nil;
	[OmniPlanParser reset];
	[self setPercentComplete:100];
	[[theApp progress] setDoubleValue:[self percentComplete]];
	[[theApp progress] setHidden:YES];
	[self setPercentComplete:0.0];
	numberDone = 0;
}

-(void)throttledRequestorDidEmptyQueue:(OCThrottledRequestor *)requestor {
	// NSLog(@"queue was emptied");
	// now we want to push the ids back to Omniplan throught the dependent parser
	[self setStatusMessage:@"Pusing info into Omniplan"];
	[[theApp statusMessage] display];
	[[theApp progress] setIndeterminate:YES];
	[[theApp progress] display];
	[OmniPlanParser encodeBasecamp:bcDictionary];
	[self cleanUp];
}

@end
