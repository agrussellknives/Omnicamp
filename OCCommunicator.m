//
//  OCCommunicator.m
//  OmniCamp
//
//  Created by Stephen Prater on 5/24/10.
//  Copyright 2010 A. G. Russell Knives. All rights reserved.
//

#import "OCCommunicator.h"
#import "NSData+Base64.h"


@implementation OCCommunicator

@synthesize userName;
@synthesize passWord;


-(NSString *)getAuthString {
	NSData *tempData = [[NSString stringWithFormat:@"%@:%@",userName,passWord] dataUsingEncoding:NSASCIIStringEncoding];
	return [NSString stringWithFormat:@"BASIC %@",[tempData base64EncodedString]];
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
	
	NSMutableDictionary *bcDict = [NSMutableDictionary dictionary];
	
	//copy the ones we want to keep.
	for(id key in keep) {
		[bcDict setObject:[planDict objectForKey:key] forKey:key];
	}
	
	NSArray *tasks = [bcDict objectForKey:@"tasks"];
	
	NSMutableArray *resources = [NSMutableArray arrayWithArray:[bcDict objectForKey:@"resources"]];
	
	// page through the tasks and set the milestones.
	NSMutableArray *milestones = [NSMutableArray arrayWithCapacity:50];
	NSMutableArray *todolists = [NSMutableArray arrayWithCapacity:50];
	NSMutableArray *todos = [NSMutableArray arrayWithCapacity:50];
	NSDictionary *task;
	
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
						  	] objectAtIndex:0];
			NSArray *convertToResource =
							[resources filteredArrayUsingPredicate:
								[NSPredicate predicateWithFormat:@"SELF.objectId == %@",
									[primaryAssignment valueForKey:@"id"]]
							];
			[todo setObject: [convertToResource objectAtIndex:0] forKey:@"assignedPrimarilyTo"];
			NSString *basecampId = [[task objectForKey:@"assignedPrimarilyTo"] valueForKeyPath:@"userData.Basecamp ID"];
			if(basecampId) {
				[todo setObject:basecampId forKey:@"responsible_party"];
			}
			[todo removeObjectForKey:@"assignments"];
			[todo removeObjectForKey:@"assignedPrimarilyTo"];
		}
		NSLog(@"finished a task");
	}
	
	
	
	return nil;
}
	
		

-(BOOL)postToBasecamp:(NSDictionary *)planDict error:(NSError **)error {
	NSDictionary *bcDictionary = [self decodeOmniPlanDict:planDict];
}
@end
