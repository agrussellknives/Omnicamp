//
//  OPDependentParser.m
//  OmniCamp
//
//  Created by Stephen Prater on 5/27/10.
//  Copyright 2010 A. G. Russell Knives. All rights reserved.
//

#import "OCDependentParser.h"


@implementation OCDependentParser 

@synthesize filePath;
@synthesize communicator;
@synthesize fileId;

-(id)init {
	if(self = [super init]) {
		todoLists = [[NSMutableArray alloc] initWithCapacity:100];
		milestones = [[NSMutableArray alloc] initWithCapacity:50];
		OmniPlanApp = [[OPApplication alloc] initWithBundleID:@"com.omnigroup.OmniPlan"];
	}
	return self;
}

-(void)dealloc {
	[todoLists release];
	[milestones release];
	[OmniPlanApp release];
	[super dealloc];
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
		if([task objectForKey:@"todo-items"]) {
			NSLog(@"task has both direct childen and group children");
			[task setObject:taskId forKey:@"milestone-id"];
		}
	}
	else {
		[task setObject:taskId forKey:@"milestone-id"];
	}
}

-(NSDictionary *)decodeOmniPlanViaScript {
	OPReference	*ref = [[[OmniPlanApp documents] byID:fileId] tasks];
		
	NSArray *tasksElements = [ref getItem];
	
	OPReference *task;
	for(task in tasksElements) {
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
			OPReference *childGroups = [[task childTasks] byTest:[[OPIts taskType] equals:[OPConstant groupTask]]]; 
			NSArray *childGroupsArray = [childGroups getItem];
			if([childTasks count] > 0) {
				NSMutableDictionary *todolistDict = [NSMutableDictionary dictionaryWithCapacity:5];
				[todolistDict setObject:[[task name] getItem] forKey:@"title"];
				[todolistDict setObject:[[task note] getItem] forKey:@"description"];
				NSString *private;
				if(private = [[[task customData] getItem] objectForKey:@"Private"]) {
					[todolistDict setObject:@"true" forKey:@"private"];
				}
				if([communicator trackTime]) {
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
					if([communicator notifyAssignees]) {
						[todoItem setObject:@"true" forKey:@"notify"];
					}
					[todoItem setObject:[[childTask id_] getItem] forKey:@"objectId"];
					[todoItems addObject:todoItem];
				}
				[todolistDict setObject:[[task id_] getItem] forKey:@"objectId"];
				if([childGroupsArray count] > 0) {
					[todolistDict setObject:(NSArray *)[[childGroups id_] getItem] forKey:@"children"];
				}
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
	NSArray *freeTasks = [[[[[OmniPlanApp documents] byID:fileId] childTasks] byTest:[[OPIts taskType] equals:[OPConstant standardTask]]] getItem];
	// restrict scope
	if([freeTasks count] > 0) {
		NSMutableDictionary *todolistDict = [NSMutableDictionary dictionaryWithCapacity:4];
		[todolistDict setObject:@"General Tasks" forKey:@"title"];
		if([communicator trackTime]) {
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
			if([communicator notifyAssignees]) {
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
		NSArray *prs = [[[[[[[OmniPlanApp documents] byID:fileId] project] tasks] byID:taskId] prerequisites] getItem];
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

-(NSDictionary *)decodeOmniPlan:(id)thePlan {
	NSDictionary *bcDict;
	if([thePlan isKindOfClass:[NSString class]]) {
		[self setFilePath:thePlan];
		OPReference *file = [[OmniPlanApp open_:[self filePath]] send];
		[self setFileId:[[file id_] getItem]];
		bcDict = [self decodeOmniPlanViaScript];
	}
	else {
		[NSException raise:@"Dependent parser did not get a file path for a plan." format:nil];
	}
	return bcDict;
}
@end
