//
//  OCCommunicator.h
//  OmniCamp
//
//  Created by Stephen Prater on 5/24/10.
//  Copyright 2010 A. G. Russell Knives. All rights reserved.
//

#import <Cocoa/Cocoa.h>
// #import "OmniPlan.h"
#import "OPGlue/OPGlue.h"


@interface OCCommunicator : NSObject {
	@private NSString* userName;
	@private NSString* passWord;
	@private int useScripting;
	@private int trackTime;
	@private int notifyAssignees;
	
	NSArray *tasksArray;
	NSArray *resourcesArray;
	
	NSMutableArray *todoLists;
	NSMutableArray *milestones;
	
	NSMutableArray *rootTasks;
	
	NSDateFormatter *omniplanDate;
	NSDateFormatter *basecampDate;
	
	NSString *filePath;
	
	OPApplication *OmniPlanApp;
}

@property (copy) NSString *userName;
@property (copy) NSString *passWord;
@property int useScripting;
@property int trackTime;
@property int notifyAssignees;

-(BOOL)postToBasecamp:(NSDictionary *)planDict error:(NSError **)error;

@end
