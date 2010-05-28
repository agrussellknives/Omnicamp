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

@class OCApp;

@interface OCCommunicator : NSObject {

	IBOutlet OCApp *theApp;
		
	@private NSString* userName;
	@private NSString* passWord;
	@private NSString* basecampURL;
	@private int useScripting;
	@private int trackTime;
	@private int notifyAssignees;
	@private int inProcess;
	@private double percentComplete;
	@private int inDeterminate;
	@private int inAnimate;
	
	@private int numberDone;
	
	@private int numberOfElements;
	
	id<OmniplanParsing> OmniPlanParser;
	NSMutableURLRequest *requestTemplate;
	OCThrottledRequestor *requestor;
	NSMapTable *requestHistory;
	
	NSMutableDictionary *bcDictionary;
	NSXMLDocument *bcXML;
}

@property (copy) NSString *userName;
@property (copy) NSString *passWord;
@property (copy) NSString *basecampURL;
@property int useScripting;
@property int trackTime;
@property int notifyAssignees;
@property (readonly) NSString *authString;
@property int inProcess;
@property double percentComplete;
@property int inDeterminate;
@property int inAnimate;
@property int numberOfElements;

-(BOOL)postToBasecamp:(NSString *)filePath error:(NSError **)error;
-(void)setFilePath:(NSString *)thePath;
-(NSString *)filePath;
-(void)updateRequestTemplate;

@end
