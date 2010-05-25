//
//  OCCommunicator.h
//  OmniCamp
//
//  Created by Stephen Prater on 5/24/10.
//  Copyright 2010 A. G. Russell Knives. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "OmniPlan.h"


@interface OCCommunicator : NSObject {
	@private NSString* userName;
	@private NSString* passWord;
	
	NSArray *tasks;
	NSArray *resources;
	
	NSMutableArray *rootTasks;
	
	NSDateFormatter *omniplanDate;
	NSDateFormatter *basecampDate;
	
	NSString *filePath;
	
	OmniPlanApplication *OmniPlanApp;
}

@property (copy) NSString *userName;
@property (copy) NSString *passWord;

-(BOOL)postToBasecamp:(NSDictionary *)planDict error:(NSError **)error;

@end
