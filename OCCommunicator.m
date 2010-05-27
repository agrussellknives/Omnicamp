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
#import "OPGlue/OPGlue.h"
#import "objc/runtime.h"


@implementation OCCommunicator

@synthesize userName;
@synthesize passWord;
@synthesize useScripting;
@synthesize trackTime;
@synthesize notifyAssignees;

-(id)init {
	if(self = [super init]) {
		tasksArray = [[NSArray alloc] init];
		resourcesArray = [[NSArray alloc] init];
		rootTasks = [[NSMutableArray alloc] init];
		
		todoLists = [[NSMutableArray alloc] initWithCapacity:100];
		milestones = [[NSMutableArray alloc] initWithCapacity:50];
		
		omniplanDate = [[NSDateFormatter alloc] initWithDateFormat:@"%Y%m%d%H%M%S" allowNaturalLanguage:NO];
		basecampDate = [[NSDateFormatter alloc] initWithDateFormat:@"%Y-%m-%dT%H:%M:%SZ" allowNaturalLanguage:NO];
		OmniPlanApp = [[OPApplication alloc] initWithBundleID:@"com.omnigroup.OmniPlan"];
	}
	return self;
}

-(void)dealloc {
	[tasksArray release];
	[resourcesArray release];
	[omniplanDate release];
	[basecampDate release];
	[rootTasks release];
	[filePath release];
	
	[todoLists release];
	[milestones release];
	
	[OmniPlanApp release];
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

- (void)eventDidFail:(const AppleEvent *)event withError:(NSError *)error {
	NSLog(@"oops, i'm tits up.");
}

-(NSString *)taskAssignedTo:(OPReference *)task {
	NSArray *taskResources = [[task assignments] getItem];
	OPReference *assignment;
	OPReference *resource;
	double maxAssign = 0.0;
	for(assignment in taskResources) {
		if(maxAssign < [[[assignment units] getItem] doubleValue])  {
			maxAssign = [[[assignment units] getItem] doubleValue];
			resource = [[assignment resource] getItem];
		}
	}
	return (maxAssign == 0.0) ? nil : [[[resource customData] getItem] objectForKey:@"Basecamp ID"];
}

-(void)dependencyForChildren:(NSMutableDictionary *)task taskId:(NSNumber *)taskId {
	NSArray *children;
	if(children = [task objectForKey:@"children"]) {
		NSNumber *childTask;
		for(childTask in children) {
			NSMutableDictionary *foundTask = [[todoLists filteredArrayUsingPredicate:
					[NSPredicate predicateWithFormat:@"SELF.objectId == %d",[childTask intValue]]
				] objectAtIndex:0];
			// there REALLY should be only one of these;
			[self dependencyForChildren:foundTask taskId:taskId];
		}
		return;
	}
	else {
		[task setObject:taskId forKey:@"milestone-id"];
	}
}
	
		
-(NSDictionary *)decodeOmniPlanViaScript {
	OPReference	*ref = [[[OmniPlanApp documents] at: 1] tasks];
		
	NSArray *tasksElements = [ref getItem];
	
	OPReference *task;
	for(task in tasksElements) {
		NSLog(@"%@",[[task taskType] getItem]);
		if([[task taskType] getItem] == [OPConstant milestoneTask]) {
			NSMutableDictionary *milestoneDict = [NSMutableDictionary dictionaryWithCapacity:5];
			[milestoneDict setObject:[[task name] getItem] forKey:@"title"];
			[milestoneDict setObject:[[task endingDate] getItem] forKey:@"due-at"];
			NSString *responsibleParty;
			if(responsibleParty = [self taskAssignedTo:task]) {
				[milestoneDict setObject:responsibleParty forKey:@"responsible-party"];
			}
			[milestoneDict setObject:[[task id_] getItem] forKey:@"objectId"];
			[milestones addObject:milestoneDict];
		}
		if([[task taskType] getItem] == [OPConstant groupTask]) {
			NSArray *childTasks = [[[task childTasks] byTest:[[[OPIts taskType] equals:[OPConstant groupTask]] NOT]] getItem];
			if([childTasks count] > 0) {
				NSMutableDictionary *todolistDict = [NSMutableDictionary dictionaryWithCapacity:5];
				[todolistDict setObject:[[task name] getItem] forKey:@"title"];
				[todolistDict setObject:[[task note] getItem] forKey:@"description"];
				NSString *private;
				if(private = [[[task customData] getItem] objectForKey:@"Private"]) {
					[todolistDict setObject:@"true" forKey:@"private"];
				}
				if(trackTime) {
					[todolistDict setObject:@"true" forKey:@"tracked"];
				}
				OPReference *childTask;
				[todolistDict setObject:[NSMutableArray arrayWithCapacity:[childTasks count]] forKey:@"todo-items"];
				NSMutableArray *todoItems = [todolistDict objectForKey:@"todo-items"];
				for(childTask in childTasks) {
					NSMutableDictionary *todoItem = [NSMutableDictionary dictionaryWithCapacity:4];
					[todoItem setObject:[[childTask name] getItem] forKey:@"content"];
					[todoItem setObject:[[childTask endingDate] getItem] forKey:@"due-at"];
					NSString *responsibleParty;
					if(responsibleParty = [self taskAssignedTo:childTask]) {
						[todoItem setObject:responsibleParty forKey:@"responsible-party"];
					}
					if(notifyAssignees) {
						[todoItem setObject:@"true" forKey:@"notify"];
					}
					[todoItem setObject:[[childTask id_] getItem] forKey:@"objectId"];
					[todoItems addObject:todoItem];
				}
				[todolistDict setObject:[[task id_] getItem] forKey:@"objectId"];
				[todoLists addObject:todolistDict];
			}
			else {
				/* we go ahead and store the child tasks here so that we can determine which milestone
				subtasks belong too. */
				NSMutableDictionary *todolistDict = [NSMutableDictionary dictionaryWithCapacity:2];
				[todolistDict setObject:[[task id_] getItem] forKey:@"objectId"];
				[todolistDict setObject:(NSArray *)[[[task childTasks] id_] getItem] forKey:@"children"];
				[todoLists addObject:todolistDict];
				
			}
		}
		/* we ignore standardTasks because we add them under groupTasks */
	}
	
	/* "free tasks"  these are independent tasks that do not belong to task group (besides the root task group)
	 in omniplan they are posted into todo_list called "general tasks" */
	NSArray *freeTasks = [[[[[OmniPlanApp documents] at: 1] childTasks] byTest:[[OPIts taskType] equals:[OPConstant standardTask]]] getItem];
	// restrict scope
	if([freeTasks count] > 0) {
		NSMutableDictionary *todolistDict = [NSMutableDictionary dictionaryWithCapacity:4];
		[todolistDict setObject:@"General Tasks" forKey:@"title"];
		if(trackTime) {
			[todolistDict setObject:@"true" forKey:@"tracked"];
		}
		[todolistDict setObject:[NSMutableArray arrayWithCapacity:[freeTasks count]] forKey:@"todo-items"];
		NSMutableArray *todoItems = [todolistDict objectForKey:@"todo-items"];
		for(task in freeTasks) {
			NSMutableDictionary *todoItem = [NSMutableDictionary dictionaryWithCapacity:4];
			[todoItem setObject:[[task name] getItem] forKey:@"content"];
			[todoItem setObject:[[task endingDate] getItem] forKey:@"due-at"];
			NSString *responsibleParty;
			if(responsibleParty = [self taskAssignedTo:task]) {
				[todoItem setObject:responsibleParty forKey:@"responsible-party"];
			}
			if(notifyAssignees) {
				[todoItem setObject:@"true" forKey:@"notify"];
			}
			[todoItem setObject:[[task id_] getItem] forKey:@"objectId"];
			[todoItems addObject:todoItem];
		}
		[todolistDict setObject:[NSNumber numberWithInt:-1] forKey:@"objectId"];
		// general tasks go at the beginning
		[todoLists insertObject:todolistDict atIndex:0];
	}
	
	// go back through the milestones and assign them to groupTasks if applicable
	NSDictionary *milestone;
	for(milestone in milestones) {
		NSNumber *taskId = [milestone objectForKey:@"objectId"];
		// i use prs, pr because i can't specll prerequiisits.
		NSArray *prs = [[[[[[[OmniPlanApp documents] at: 1] project] tasks] byID:taskId] prerequisites] getItem];
		OPReference *pr;
		for(pr in prs) {
			NSNumber *dependsOn = [[[pr prerequisiteTask] id_] getItem];
			NSArray *onMilestone = [todoLists filteredArrayUsingPredicate:
				[NSPredicate predicateWithFormat:@"SELF.objectId == %d",[dependsOn intValue]]
			];
			NSMutableDictionary *dependMilestone;
			for(dependMilestone in onMilestone) {
				[self dependencyForChildren:dependMilestone taskId:taskId];
			}
		}
	}
	NSMutableDictionary *retDict = [NSMutableDictionary dictionaryWithCapacity:2];
	[retDict setObject:milestones forKey:@"milestones"];
	[retDict setObject:todoLists forKey:@"todo-lists"];
	return retDict;
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
	milestones = [NSMutableArray arrayWithCapacity:50];
	todoLists = [NSMutableArray arrayWithCapacity:50];
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

-(void)setFilePath:(NSString *)thePath {
	filePath = [thePath retain];
}

-(BOOL)postToBasecamp:(NSDictionary *)planDict error:(NSError **)error {
	if(useScripting) {
		if(OmniPlanApp) {
			NSDictionary *bcDictionary = [self decodeOmniPlanViaScript];
		}
		else {
			NSRunAlertPanel(@"OmniPlan is not running", @"You should have Omniplan Running in order to use this application", nil, nil, nil);
			return NO;
		}
	}
}
@end
