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
		requestHistory = [[NSMutableDictionary alloc] init];
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
	[self updateRequestTemplate];
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

-(void)updateMilestoneDependenciesGivenMilestoneIds:(NSXMLDocument *)milestoneData {
	
}

-(void)uploadMilestones:(NSDictionary *)bcDictionary {
	NSArray *newMilestones = [[bcDictionary objectForKey:@"milestones"] filteredArrayUsingPredicate:
								[NSPredicate predicateWithFormat:@"SELF.basecampID == NIL"]];
	NSXMLDocument *milestones = [newMilestones serializeToXMLWithRootNamed:@"request" tagName:@"milestone"];
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
	
	OCUploadPlan *thePlan = [[OCUploadPlan alloc] init];
	// first step, set the URL
	/* op types */
		// update (xpath) - with path to replace, path to new value
		// upload (xpath)
		// set_path (URL) - url to upload too
		// get (URL)
	
	OCUploadOperation *setPathToProjects = [OCUploadOperation opWithType:@"set_path"];
	[setPathToProjects setValue:[NSString stringWithFormat:@"%@/project/%@",basecampURL,[bcDictionary objectForKey:@"project-id"]] forOpInfo:@"new_path"];
	
	[thePlan addStep:[OCUploadStep stepWithOperation:setPathToProjects]];
	OCUploadStep *milestoneStep = [OCUploadStep stepWithName:@"milestones" xPath:@"/milestones/milestone" op:@"upload"];
	OCUploadStep *updateTodoMilestones = [OCUploadStep stepWithName:@"updatetdl_milestones" xPath:@"/todo-lists/todo-list" parent:milestoneStep];
	OCUploadOperation *updateMileStoneOp = [OCUploadOperation opWithType:@"update"];
	[updateMileStoneOp setValue:@"milestone-id" forOpInfo:@"replace"];
	[updateMileStoneOp setValue:@"milestone[objectId=./milestone-id]/id" forOpInfo:@"with"];
	[updateTodoMilestones setOperation:updateMileStoneOp];
	
	[thePlan addStep:milestoneStep];
	[thePlan addStep:updateTodoMilestones];
															
	
	/* // do milestones first...
	NSXMLDocument *milestones = [[bcDictionary objectForKey:@"milestones"] serializeToXMLWithRootNamed:@"request"];
	NSMutableURLRequest *req = [requestTemplate copy];]
	[req setHTTPBody:[milestones XMLData]];
	[requestor addRequestToQueue:req];
	*/
	NSString *whatever = nil;
	NSData *planData = [NSKeyedArchiver archivedDataWithRootObject:thePlan];
	NSData *xml = [NSPropertyListSerialization dataFromPropertyList:planData
		format:NSPropertyListXMLFormat_v1_0 errorDescription:&whatever];
	[xml writeToFile:@"/Users/stephenp/Desktop/plan.plist" atomically:NO];
	
	
	
	return NO;
}

-(void)processData:(NSData *)data forRequest:(NSURLRequest *)req {
	NSLog(@"%@",[[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease]);
}
-(void)processResponse:(NSHTTPURLResponse *)response forRequest:(NSURLRequest *)req {
	NSLog(@"%@",response);
}

@end
