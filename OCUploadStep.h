//
//  OCUploadStep.h
//  OmniCamp
//
//  Created by Stephen Prater - new on 5/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "OCUploadOperation.h"


@interface OCUploadStep : NSObject {
	@private NSString *name;
	@private NSString  *xpath;
	
	OCUploadStep *parent;
	OCUploadOperation *operation;
	NSMutableArray *dependents;
	NSURLRequest *request;
	
	@private int nextDependent;
}
@property (copy) NSString *name;
@property (copy) NSString *xpath;

-(void)setOperation:(OCUploadOperation *)anOperation;
-(void)addDependent:(OCUploadStep *)aDependent;
-(OCUploadStep *)nextDependent;

-(OCUploadStep *)initWithName:(NSString *)aName xPath:(NSString *)anXpath parent:(OCUploadStep *)aParent;
+(OCUploadStep *)stepWithName:(NSString *)aName xPath:(NSString *)anXpath parent:(OCUploadStep *)aParent;
+(OCUploadStep *)stepWithName:(NSString *)aName xPath:(NSString *)anXpath op:(OCUploadOperation *)anOperation parent:(OCUploadStep *)aParent;
+(OCUploadStep *)stepWithName:(NSString *)aName xPath:(NSString *)anXpath op:(OCUploadOperation *)anOperation;
+(OCUploadStep *)stepWithOperation:(OCUploadOperation *)anOperation;

@end