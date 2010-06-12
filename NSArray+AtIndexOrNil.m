//
//  NSArray+AtIndexOrNil.m
//  OmniCamp
//
//  Created by Stephen Prater - new on 5/25/10.
//  Copyright 2010 A. G. Russell Knives All rights reserved.
//

#import "NSArray+AtIndexOrNil.h"


@implementation NSArray (AtIndexOrNil)

-(id)objectOrNilAtIndex:(NSUInteger)index {
	if(index > [self count]) {
		return nil;
	}
	else {
		return [self objectAtIndex:index];
	}
}

@end
