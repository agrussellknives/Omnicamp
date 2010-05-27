//
//  OPDependentParser.h
//  OmniCamp
//
//  Created by Stephen Prater on 5/27/10.
//  Copyright 2010 A. G. Russell Knives. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "OmniplanParsing.h"
#import "OPGlue/OPGlue.h"
#import "OCCommunicator.h"

@interface OCDependentParser : NSObject <OmniplanParsing> {
	NSMutableArray *todoLists;
	NSMutableArray *milestones;
	OPApplication *OmniPlanApp;
	
	//protocol properties
	@private NSString *filePath;
	@private OCCommunicator *communicator;
	
	//keeping track of the file
	@private NSString *fileId;
}

@property (copy) NSString *fileId;

@end
