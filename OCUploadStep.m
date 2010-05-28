//
//  OCUploadStep.m
//  OmniCamp
//
//  Created by Stephen Prater - new on 5/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "OCUploadStep.h"
#import "NSArray+AtIndexOrNil.h"


@implementation OCUploadStep

@synthesize name;
@synthesize xpath;

-(OCUploadStep *)init {
	if(self=[super init]) {
		nextDependent = 0;
		operation = [[OCUploadOperation alloc] init];
		dependents = [[NSMutableArray alloc] initWithCapacity:5];
		request = nil;
	}
	return self;
}

-(void)encodeWithCoder:(NSCoder *)encoder
{
	[encoder encodeObject:name forKey:@"name"];
	[encoder encodeObject:xpath forKey:@"xpath"];
	[encoder encodeObject:operation forKey:@"operation"];
	[encoder encodeObject:dependents forKey:@"dependents"];
}

-(OCUploadStep *)initWithName:(NSString *)aName xPath:(NSString *)anXpath parent:(OCUploadStep *)aParent {
	self = [self init];
	parent = aParent; //weak ref;
	[self setName:aName];
	[self setXpath:anXpath];
	[aParent addDependent:self];
	return self;
}

+(OCUploadStep *)stepWithName:(NSString *)aName xPath:(NSString *)anXpath parent:(OCUploadStep *)aParent {
	return [[[OCUploadStep alloc] initWithName:aName xPath:anXpath parent:aParent] autorelease];
}

+(OCUploadStep *)stepWithName:(NSString *)aName xPath:(NSString *)anXpath op:(OCUploadOperation *)anOperation parent:(OCUploadStep *)aParent {
	OCUploadStep *hold = [[[OCUploadStep alloc] initWithName:aName xPath:anXpath parent:aParent] autorelease];
	[hold setOperation:anOperation];
	return hold;
}

+(OCUploadStep *)stepWithName:(NSString *)aName xPath:(NSString *)anXpath op:(OCUploadOperation *)anOperation {
	return [OCUploadStep stepWithName:aName xPath:anXpath op:anOperation parent:nil];
}

+(OCUploadStep *)stepWithOperation:(OCUploadOperation *)anOperation {
	OCUploadStep *hold = [[OCUploadStep alloc] init];
	[hold setOperation:anOperation];
	[hold autorelease];
	return hold;
}

-(void)dealloc {
	[operation release];
	[dependents release];
	[request release];
	[super dealloc];
}

-(void)setOperation:(OCUploadOperation *)anOperation {
	[operation release];
	operation = anOperation;
	[operation retain];
}


-(void)addDependent:(OCUploadStep *)aDependent {
	[dependents addObject:aDependent];
}

-(OCUploadStep *)nextDependent {
	OCUploadStep *step;
	if(nextDependent == 0) {
		nextDependent++;
		return self;
	}
	else {
		while(nextDependent < [dependents count]) {
			step = [[dependents objectOrNilAtIndex:nextDependent] nextDependent];
			if(!step) {
				nextDependent++;
			}
			return step;
		}
	}
	return nil;
}


@end
