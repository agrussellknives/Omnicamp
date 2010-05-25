//
//  NSArray+maxiumValue.m
//  OmniCamp
//
//  Created by Stephen Prater on 5/25/10.
//  Copyright 2010 A. G. Russell Knives. All rights reserved.
//

#import "NSArray+maximumValue.h"

@implementation NSArray (WithMaximum)
- (id)maximumValue
{
  if ( [self count] == 0 ) return nil;
  id maybeMax = [self objectAtIndex: 0];
  NSEnumerator *en = [self objectEnumerator];
  id el;
  while ( (el=[en nextObject]) != nil ) {
    if ( [maybeMax respondsToSelector: @selector(compare:)] &&
	 [el respondsToSelector: @selector(compare:)]       &&
	 [el isKindOfClass: [NSNumber class]]               &&
	 [maybeMax isKindOfClass: [NSNumber class]] ) {
      if ( [maybeMax compare: el] == NSOrderedAscending )
	maybeMax = el;
    } else { return nil; }
  }
  return maybeMax;
}

-(id)sum
{
	if([self count] == 0) {
		return nil;
	}
	double accumulator = 0;
	for(id item in self) {
		if([item isKindOfClass:[NSNumber class]]) {
			accumulator += [item doubleValue];
		}
	}
	return [NSNumber numberWithDouble:accumulator];
}
	
@end
