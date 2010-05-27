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
#import "OmniplanParsing.h"
#import "OCDependentParser.h"
#import "OCIndependentParser.h"


@implementation OCCommunicator

@synthesize userName;
@synthesize passWord;
@synthesize useScripting;
@synthesize trackTime;
@synthesize notifyAssignees;

-(id)init {
	if(self = [super init]) {		
	}
	return self;
}

-(void)dealloc {
	[OmniPlanParser release];
	[super dealloc];
}

- (void)awakeFromNib {
	NSLog(@"communicator awoke");
	if(useScripting) {
		OmniPlanParser = [[OCDependentParser alloc] init];
	}
	else {
		OmniPlanParser = [[OCIndependentParser alloc] init];
	}
	[OmniPlanParser setCommunicator:self];
}		


-(NSString *)getAuthString {
	NSData *tempData = [[NSString stringWithFormat:@"%@:%@",userName,passWord] dataUsingEncoding:NSASCIIStringEncoding];
	return [NSString stringWithFormat:@"BASIC %@",[tempData base64EncodedString]];
}


-(NSString *)filePath {
	return [OmniPlanParser filePath];
}

-(void)setFilePath:(NSString *)thePath {
	[OmniPlanParser setFilePath:thePath];
}

-(BOOL)postToBasecamp:(NSString *)filePath error:(NSError **)error {
	NSDictionary *bcDictionary;
	[self setFilePath:filePath];
	
	if(useScripting) {
		bcDictionary = [OmniPlanParser decodeOmniPlan:filePath];
	}
	else {
		NSRunAlertPanel(@"Independent Parsing not implemented",
		@"Independent analysis and posting of Omniplan Project files is not fully implemented."
		"The routine will run and output info the console, but no data will be posted.  You may"
		"experience errors.", nil, nil, nil);
		bcDictionary = [OmniPlanParser decodeOmniPlan:filePath];
	}
	NSLog(@"%@",bcDictionary);
	return NO;
}
@end
