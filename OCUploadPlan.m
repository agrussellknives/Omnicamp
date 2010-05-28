//
//  OCUploadPlan.m
//  OmniCamp
//
//  Created by Stephen Prater - new on 5/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "OCUploadPlan.h"
#import "NSArray+AtIndexOrNil.h"


@implementation OCUploadPlan

-(NSInvocation *)invocationForStep:(OCUploadStep *)aStep {
	// this will actually be the hard part
}

-(void)encodeWithCoder:(NSCoder *)encoder
{
	[encoder encodeObject:steps forKey:@"steps"];
}

-(OCUploadPlan *)init {
	if(self = [super init]) {
		steps = [[NSMutableArray alloc] initWithCapacity:5];
		completedSteps = [[NSMutableArray alloc] initWithCapacity:5];
	}
	return self;
}

-(void)dealloc {
	[steps release];
	[completedSteps release];
	[super dealloc];
}

-(void)addStep:(OCUploadStep *)aStep {
	[steps addObject:aStep];
}

-(OCUploadStep *)nextStep {
	OCUploadStep *step;
	if(!(step = [currentStep nextDependent])) {
		if(!(step = [steps objectOrNilAtIndex:0])) {
			return nil;
		}
	}
	[completedSteps addObject:currentStep];
	currentStep = step;
	return step;
}
	

@end
