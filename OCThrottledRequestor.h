//
//  OCThrottledRequestor.h
//  OmniCamp
//
//  Created by Stephen Prater on 5/27/10.
//  Copyright 2010 A. G. Russell Knives. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface OCThrottledRequestor : NSObject {
	@private NSTimeInterval requestDelay;
	@private NSMutableArray *requestQueue;
	
	@private NSMutableArray *responseQueue;
	@private NSTimer *requestTimer;
	@private BOOL makeRequests;
	
	NSMutableDictionary *responseDispatch;
	
}

@property (assign) NSTimeInterval requestDelay;
@property (assign) BOOL makeRequests;

+(OCThrottledRequestor *)sharedThrottledRequestor;
-(void)addRequestToQueue:(NSURLRequest *)request;
-(void)stopQueue;

@end

// informal protocol for objects that own a request through the throttler.
@interface NSObject (OCThrottledRequestOwner) 

-(void)processData:(NSData *)data forRequest:(NSURLRequest *)req;
-(void)processResponse:(NSHTTPURLResponse *)response forRequest:(NSURLRequest *)req;

@end
