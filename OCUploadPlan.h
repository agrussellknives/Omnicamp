//
//  OCUploadPlan.h
//  OmniCamp
//
//  Created by Stephen Prater - new on 5/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "OCUploadStep.h"
#import "OCUploadPlan.h"


@interface OCUploadPlan : NSObject {
	@private OCUploadStep *currentStep;
	
	NSMutableArray *steps;
	NSMutableArray *completedSteps;
}

-(void)addStep:(OCUploadStep *)aStep;
-(NSInvocation *)invocationForStep:(OCUploadStep *)aStep;
-(OCUploadPlan *)init;

@end
