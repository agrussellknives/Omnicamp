//
//  OPIndependentParser.h
//  OmniCamp
//
//  Created by Stephen Prater on 5/27/10.
//  Copyright 2010 A. G. Russell Knives. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "OmniplanParsing.h"
#import "OCCommunicator.h"

@interface OCIndependentParser : NSObject <OmniplanParsing> {
	NSArray *tasksArray;
	NSArray *resourcesArray;
	NSMutableArray *rootTasks;
	NSDateFormatter *omniplanDate;
	NSDateFormatter *basecampDate;
	
	//protocol properties
	@private NSString *filePath;
	@private OCCommunicator *communicator;
}

@end
