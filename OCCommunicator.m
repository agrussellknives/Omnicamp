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
#import "OmniPlan.h"
#import "objc/runtime.h"


@implementation OCCommunicator

@synthesize userName;
@synthesize passWord;

-(id)init {
	if(self = [super init]) {
		tasks = [[NSArray alloc] init];
		resources = [[NSArray alloc] init];
		rootTasks = [[NSMutableArray alloc] init];
		omniplanDate = [[NSDateFormatter alloc] initWithDateFormat:@"%Y%m%d%H%M%S" allowNaturalLanguage:NO];
		basecampDate = [[NSDateFormatter alloc] initWithDateFormat:@"%Y-%m-%dT%H:%M:%SZ" allowNaturalLanguage:NO];
		OmniPlanApp = [SBApplication applicationWithBundleIdentifier:@"com.omnigroup.OmniPlan"];
	}
	return self;
}

-(void)dealloc {
	[tasks release];
	[resources release];
	[omniplanDate release];
	[basecampDate release];
	[rootTasks release];
	[filePath release];
	[super dealloc];
}


-(NSString *)getAuthString {
	NSData *tempData = [[NSString stringWithFormat:@"%@:%@",userName,passWord] dataUsingEncoding:NSASCIIStringEncoding];
	return [NSString stringWithFormat:@"BASIC %@",[tempData base64EncodedString]];
}

-(NSDictionary *)prerequisitesContainsRootTask:(NSArray *)prereqs {
	NSDictionary *task;
	for(task in prereqs) {
		if([[prereqs filteredArrayUsingPredicate:
						[NSPredicate predicateWithFormat:@"%@ in %@",task,rootTasks]
					] count] != 0) {
				// i one of my ancestors in the root task list.
				return task;
			}
		}
	// none of those prereqs are a root task;
	return nil;
}

-(NSArray *)taskPrerequisitesFor:(NSDictionary *)task {
	NSArray *prereqs = [task objectForKey:@"prerequisites"];
	NSMutableArray *ancestors = [NSMutableArray arrayWithCapacity:5];
	if(prereqs == nil) { 
		return nil; 
	}
	else {
		NSDictionary *prereq;
		for(prereq in prereqs) {
			NSDictionary *pretask =
				[
					[tasks filteredArrayUsingPredicate:
						[NSPredicate predicateWithFormat:@"SELF.objectId == %@",[prereq objectForKey:@"id"]]
					]
				objectOrNilAtIndex:0];
			if(pretask) { [ancestors addObject:pretask]; }
		}
	}
	return ancestors;
}

-(double)getBranchValue:(NSDictionary *)task {
	double branchValue = [[task objectForKey:@"workSeconds"] doubleValue];
	double startTime;
	NSMutableArray *maxBranch = [NSMutableArray arrayWithCapacity:50];
		if([task objectForKey:@"prerequisites"]) {
			NSDictionary *pre;
			NSArray *prereqs = [self taskPrerequisitesFor:task];	
			for(pre in prereqs) {
				[maxBranch addObject:[NSNumber numberWithDouble:[self getBranchValue:pre]]];
			}
		}
		else {
			NSString *startDate = nil;
			startDate = [task objectForKey:@"desiredStart"] ? [task objectForKey:@"desiredStart"] : [task objectForKey:@"forcedStart"];
			if(!startDate) {
				NSLog(@"Couldn't find a start time, using the earliest one");
				startTime = [[omniplanDate dateFromString:[[rootTasks objectAtIndex:0] objectForKey:@"desiredStart"]] timeIntervalSince1970];
			}
			startTime + branchValue;
			return startTime + branchValue;
		}
	return branchValue + [[maxBranch sum] doubleValue];
}

			
		
		

-(NSDictionary *)decodeOmniPlanDict:(NSDictionary *)planDict {
	// keys to keep from omniplan dictionary
	NSArray *keep = [NSArray arrayWithObjects:
		@"endDate",
		@"projectUserKeys",
		@"resources",
		@"resourceUserKeys",
		@"tasks",
		@"taskUserKeys",
		@"userData",
		nil];
		
	OmniPlanDocument *theDoc = [OmniPlanApp open:filePath];
	
	NSMutableDictionary *bcDict = [NSMutableDictionary dictionary];
	
	//copy the ones we want to keep.
	for(id key in keep) {
		id obj;
		if(obj = [planDict objectForKey:key]) {
			[bcDict setObject:obj forKey:key];
		}
	}
	
	tasks = [NSArray arrayWithArray:[bcDict objectForKey:@"tasks"]];
	resources = [NSArray arrayWithArray:[bcDict objectForKey:@"resources"]];
	
	// page through the tasks and set the milestones.
	NSMutableArray *milestones = [NSMutableArray arrayWithCapacity:50];
	NSMutableArray *todolists = [NSMutableArray arrayWithCapacity:50];
	NSMutableArray *todos = [NSMutableArray arrayWithCapacity:50];
	NSMutableDictionary *task;
	
	
		// root tasks
	// there is generally only one of these, but there might be more.
	
	rootTasks = [NSMutableArray arrayWithCapacity:1];
	for(task in tasks) {
		if([task objectForKey:@"desiredStart"] && ![task objectForKey:@"prerequisites"]) {
			[rootTasks addObject:task];
		}
	}
	
	for(task in tasks) {
		id keyValue;
		if(keyValue = (NSNumber *)[task objectForKey:@"objectId"]) {
			// the root task is not translated
			if([keyValue intValue] == -1) {
				continue;
			}
		}
		if(keyValue = (NSNumber *)[task objectForKey:@"effort"]) {
			// all efforts use number...
			if([keyValue intValue] == 0) {
				// do i need to retain the task here?
				[milestones addObject:[NSMutableDictionary dictionaryWithDictionary:task]];
			}
			else {
				// then it is standard to do item
				[todos addObject:[NSMutableDictionary dictionaryWithDictionary:task]];
			}
		}
		else if ([task objectForKey:@"children"]) {
			[todolists addObject:[NSMutableDictionary dictionaryWithDictionary:task]];
			// add this todolist to each of it's childrens prereqs so that we can calculate the date better
			NSArray *childTasks = [tasks filteredArrayUsingPredicate:
										[NSPredicate predicateWithFormat:@"SELF.objectId IN %@",[task objectForKey:@"children"]
								  ]];
			NSMutableDictionary *child;
			for(child in childTasks) {
				NSMutableArray *prerequisites;
				if(prerequisites = [child objectForKey:@"prerequisites"]) {
					[prerequisites addObject:[NSDictionary dictionaryWithObject:[task objectForKey:@"objectId"] forKey:@"id"]];
				}
				else {
					[child setObject:[NSMutableArray arrayWithCapacity:5] forKey:@"prerequisites"];
					NSLog(@"fixing to inser object");
					[[child objectForKey:@"prerequisites"] addObject:[NSDictionary dictionaryWithObject:[task objectForKey:@"objectId"] forKey:@"id"]];
				}
			}
		}
		else {
			NSLog(@"found a task type i don't know how to deal with.");
		}
	}
	
	// find all children of partiular todolists
	
	// predicate test

	NSMutableDictionary *todolist;
	for(todolist in todolists) {
		[todolist setObject:
			[todos filteredArrayUsingPredicate:
				[NSPredicate predicateWithFormat:@"SELF.objectId IN %@",[todolist objectForKey:@"children"]
			]] forKey:@"tasks"];
		if([[todolist objectForKey:@"tasks"] count] == 0) {
			[todolist setObject:[NSNumber numberWithBool:TRUE] forKey:@"noDirectChildren"];
			continue;
		}
		[todolist removeObjectForKey:@"children"];
		
		NSMutableDictionary *todo;
		for(todo in [todolist objectForKey:@"tasks"]) {
			NSArray *assignments = [todo objectForKey:@"assignments"];
			NSDictionary *primaryAssignment = [
							[assignments filteredArrayUsingPredicate:
								[NSPredicate predicateWithFormat:@"SELF.units == %@", [assignments valueForKeyPath:@"@max.units"]]
						  	] objectOrNilAtIndex:0];
			if(!primaryAssignment) { continue; }
			NSArray *convertToResource = [
							[resources filteredArrayUsingPredicate:
								[NSPredicate predicateWithFormat:@"SELF.objectId == %@",
									[primaryAssignment valueForKey:@"id"]]
							] objectOrNilAtIndex:0];
			if(!convertToResource) { continue; }
			NSString *basecampId = [convertToResource valueForKeyPath:@"userData.Basecamp ID"];
			if(basecampId) {
				[todo setObject:basecampId forKey:@"responsible_party"];
			}
			[todo removeObjectForKey:@"assignments"];
			[todo removeObjectForKey:@"effort"];
			[todo removeObjectForKey:@"workTime"];
			[todo setObject:[todo objectForKey:@"task"] forKey:@"name"];
			[todo removeObjectForKey:@"task"];

			
			// calculate the due date by backing up the prereq chain until we find a "rootTask" - ie a task with
			// no prerequisites  set it to the date farthest out.
			/* [todo setObject:
				[basecampDate stringFromDate:[NSDate dateWithTimeIntervalSince1970:
					[self getBranchValue:todo]]
				]
				forKey:@"due-at"]; */
		}
	
		
		NSLog(@"finished a task");
	}
	NSLog(@"finished all tasks");
	return todolists;
}

-(void)setFilePath:(NSString *)thePath {
	filePath = [thePath retain];
}

-(BOOL)postToBasecamp:(NSDictionary *)planDict error:(NSError **)error {
	if([OmniPlanApp	isRunning]) {
		NSDictionary *bcDictionary = [self decodeOmniPlanDict:planDict];
	}
	else {
		NSRunAlertPanel(@"OmniPlan is not running", @"You should have Omniplan Running in order to use this application", nil, nil, nil);
		return NO;
	}
}
@end
