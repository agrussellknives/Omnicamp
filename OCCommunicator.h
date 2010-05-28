//
//  OCCommunicator.h
//  OmniCamp
//
//  Created by Stephen Prater on 5/24/10.
//  Copyright 2010 A. G. Russell Knives. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "OmniplanParsing.h"
#import "OCThrottledRequestor.h"
#import "OPGlue/OPGlue.h"


@interface OCCommunicator : NSObject {
	@private NSString* userName;
	@private NSString* passWord;
	@private NSString* basecampURL;
	@private int useScripting;
	@private int trackTime;
	@private int notifyAssignees;
	
	id<OmniplanParsing> OmniPlanParser;
	NSMutableURLRequest *requestTemplate;
	OCThrottledRequestor *requestor;
	NSMutableDictionary *requestHistory;
	
	NSMutableDictionary *bcDictionary;
}

@property (copy) NSString *userName;
@property (copy) NSString *passWord;
@property (copy) NSString *basecampURL;
@property int useScripting;
@property int trackTime;
@property int notifyAssignees;
@property (readonly) NSString *authString;

-(BOOL)postToBasecamp:(NSString *)filePath error:(NSError **)error;
-(void)setFilePath:(NSString *)thePath;
-(NSString *)filePath;

@end
