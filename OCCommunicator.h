//
//  OCCommunicator.h
//  OmniCamp
//
//  Created by Stephen Prater on 5/24/10.
//  Copyright 2010 A. G. Russell Knives. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface OCCommunicator : NSObject {
	@private NSString* userName;
	@private NSString* passWord;
}

@property (copy) NSString *userName;
@property (copy) NSString *passWord;

-(BOOL)postToBasecamp:(NSDictionary *)planDict error:(NSError **)error;

@end
