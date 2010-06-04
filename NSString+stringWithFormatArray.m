//
//  NSString+stringWithFormat:array.m
//  OmniCamp
//
//  Created by stephenprater on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "NSString+stringWithFormat:array.h"


@implementation NSString (stringWithFormatAcceptingArray)


+(NSString *)stringWithFormat:(NSString *)format objectValues:(NSArray *)values {
	id args[ [values count] ];
	NSUInteger index = 0;
	for(id item in values) {
		args[index++] = item;
	}
	return [[[NSString alloc] initWithFormat:format arguments:(va_list)values] autorelease];
}

@end
