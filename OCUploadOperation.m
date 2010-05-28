//
//  OCUploadOperation.m
//  OmniCamp
//
//  Created by Stephen Prater - new on 5/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "OCUploadOperation.h"


@implementation OCUploadOperation

@synthesize type;

-(OCUploadOperation *)init {
	if(self = [super init]) {
		opInfo = [[NSMutableDictionary alloc] initWithCapacity:3];
	}
	return self;
}

-(void)encodeWithCoder:(NSCoder *)encoder {
	[encoder encodeObject:type forKey:@"type"];
	id key;
	for(key in [opInfo allKeys]) {
		[encoder encodeObject:[opInfo objectForKey:key] forKey:key];
	}
}

-(OCUploadOperation *)initWithType:(NSString *)opType {
	self = [self init];
	[self setType:opType];
	return self;
}

+(OCUploadOperation *)opWithType:(NSString *)opType {
	return [[[OCUploadOperation alloc] initWithType:opType] autorelease];
}

-(void)dealloc {
	[opInfo release];
	[super dealloc];
}

-(void)setValue:(NSString *)aString forOpInfo:(NSString *)opInfoKey {
	[opInfo setObject:aString forKey:opInfoKey];
}

-(void)setValues:(NSArray *)values forOpInfos:(NSArray *)opInfoKeys {
	if([values count] != [opInfoKeys count]) {
		[NSException raise:@"Key Count Mismatch" format:@"Must pass same number of values to set operational dict"];
	}
	int i;
	int count = [values count];
	for(i=0;i<=count;i++) {
		[self setValue:[values objectAtIndex:i] forOpInfo:[opInfoKeys objectAtIndex:i]];
	}
}

-(void)setOpInfoDict:(NSDictionary *)opDict {
	[opInfo release];
	opInfo = [[NSMutableDictionary alloc] initWithDictionary:opDict];
}

@end
