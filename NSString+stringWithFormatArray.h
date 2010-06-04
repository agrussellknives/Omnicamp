//
//  NSString+stringWithFormat:array.h
//  OmniCamp
//
//  Created by stephenprater on 6/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NSString (stringWithFormatAcceptingArray)
+(NSString *)stringWithFormat:(NSString *)format objectValues:(NSArray *)values
@end
