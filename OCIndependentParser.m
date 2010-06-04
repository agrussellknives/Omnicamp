//
//  OPIndependentParser.m
//  OmniCamp
//
//  Created by Stephen Prater on 5/27/10.
//  Copyright 2010 A. G. Russell Knives. All rights reserved.
//

#import "OCIndependentParser.h"
#import "NSArray+AtIndexOrNil.h"
#import "NSArray+maximumValue.h"


@implementation OCIndependentParser

@synthesize filePath;
@synthesize communicator;

-(id)init {
	if(self = [super init]) {
		tasksArray = [[NSArray alloc] init];
		resourcesArray = [[NSArray alloc] init];
		rootTasks = [[NSMutableArray alloc] init];
		omniplanDate = [[NSDateFormatter alloc] initWithDateFormat:@"%Y%m%d%H%M%S" allowNaturalLanguage:NO];
		basecampDate = [[NSDateFormatter alloc] initWithDateFormat:@"%Y-%m-%dT%H:%M:%SZ" allowNaturalLanguage:NO];
	}
	return self;
}

-(void)dealloc {
	[tasksArray release];
	[resourcesArray release];
	[omniplanDate release];
	[basecampDate release];
	[rootTasks release];
	[super dealloc];
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
					[tasksArray filteredArrayUsingPredicate:
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
		
	// there's only ever one plan in a document
	/* FourCharCode proj = 'OPpj';

	OmniPlanProject *proj = (OmniPlanProject *)[[(OmniPlanDocument *)[OmniPlanApp open:filePath] elementArrayWithCode:proj] objectAtIndex:0]
	*/
	NSMutableDictionary *bcDict = [NSMutableDictionary dictionary];
	
	
	//copy the ones we want to keep.
	for(id key in keep) {
		id obj;
		if(obj = [planDict objectForKey:key]) {
			[bcDict setObject:obj forKey:key];
		}
	}
	
	tasksArray = [NSArray arrayWithArray:[bcDict objectForKey:@"tasks"]];
	resourcesArray = [NSArray arrayWithArray:[bcDict objectForKey:@"resources"]];
	
	// page through the tasks and set the milestones.
	NSMutableArray *milestones = [NSMutableArray arrayWithCapacity:50];
	NSMutableArray *todoLists = [NSMutableArray arrayWithCapacity:50];
	NSMutableArray *todos = [NSMutableArray arrayWithCapacity:50];
	NSMutableDictionary *task;
	
	
		// root tasks
	// there is generally only one of these, but there might be more.
	
	rootTasks = [NSMutableArray arrayWithCapacity:1];
	for(task in tasksArray) {
		if([task objectForKey:@"desiredStart"] && ![task objectForKey:@"prerequisites"]) {
			[rootTasks addObject:task];
		}
	}
	
	for(task in tasksArray) {
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
			[todoLists addObject:[NSMutableDictionary dictionaryWithDictionary:task]];
			// add this todolist to each of it's childrens prereqs so that we can calculate the date better
			NSArray *childTasks = [tasksArray filteredArrayUsingPredicate:
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
	for(todolist in todoLists) {
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
							[resourcesArray filteredArrayUsingPredicate:
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
			// [proj 
			
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
	return nil;
}

-(NSMutableDictionary *)decodeOmniPlan:(id)thePlan {
	NSMutableDictionary *bcDict;
	if([thePlan isKindOfClass:[NSString class]]) {
		NSString *pathToContents = [NSString stringWithFormat:@"%@/contents.xml",thePlan];
		NSDictionary *planDict  = [NSDictionary dictionaryWithContentsOfFile:pathToContents];
		bcDict = [NSMutableDictionary dictionaryWithDictionary:[self decodeOmniPlanDict:planDict]];
	}
	else if([thePlan isKindOfClass:[NSDictionary class]]) {
		bcDict = [NSMutableDictionary dictionaryWithDictionary:[self decodeOmniPlanDict:thePlan]];
	}
	else {
		[NSException raise:@"Independent parser did not get a file path or dictionary for a plan." format:nil];
	}
	return bcDict;
}

-(void)encodeBasecamp:(NSDictionary *)planDict {
	return;
}
-(void)reset {
	return;
}
@end
