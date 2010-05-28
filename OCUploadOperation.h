//
//  OCUploadOperation.h
//  OmniCamp
//
//  Created by Stephen Prater - new on 5/28/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface OCUploadOperation : NSObject {
	@private NSString *type;
	NSMutableDictionary *opInfo;
}

@property (copy) NSString *type;
-(void)setValue:(NSString *)aString forOpInfo:(NSString *)opInfoKey;
-(void)setValues:(NSArray *)values forOpInfos:(NSArray *)opInfoKeys;
-(void)setOpInfoDict:(NSDictionary *)opDict;


+(OCUploadOperation *)opWithType:(NSString *)opType;
-(OCUploadOperation *)initWithType:(NSString *)opType;

@end
