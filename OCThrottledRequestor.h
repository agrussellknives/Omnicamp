
//
//  OCThrottledRequestor.h
//  OmniCamp
//
//  Created by Stephen Prater on 5/27/10.
//  Copyright 2010 A. G. Russell Knives. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface OCThrottledRequestor : NSObject {
	@private double requestDelay;
	@private NSMutableArray *requestQueue;
	
	@private NSMutableArray *responseQueue;
	@private NSTimer *requestTimer;
	@private BOOL makeRequests;
	
	@private BOOL suppressFurtherErrors;
	
	NSMapTable *responseDispatch;
	
	id delegate;
	
}

@property (assign) id delegate;
@property (assign) double requestDelay;
@property (assign) BOOL makeRequests;

+(OCThrottledRequestor *)sharedThrottledRequestor;
-(void)addRequestToQueue:(NSURLRequest *)request;
-(void)addRequestToQueue:(NSURLRequest *)request withOwner:(id)owner;
-(void)resumeAfter:(double)delay;
-(void)startQueue:(NSTimer *)timer;
-(void)nextInQueue:(NSTimer *)timer;
-(void)nextInQueue;
-(void)startQueue;
-(void)stopQueue;
-(void)clearAndStopQueue;

@end

// informal protocol for objects that own a request through the throttler.
@interface NSObject (OCThrottledRequestOwner) 

-(void)processData:(NSData *)data forRequest:(NSURLRequest *)req;
-(void)processResponse:(NSHTTPURLResponse *)response forRequest:(NSURLRequest *)req;

@end

// informal protocal for throttled requestor delgate;
@interface NSObject (OCThrottledRequestDelegate)

-(void)throttledRequestorDidEmptyQueue:(OCThrottledRequestor *)requestor;

@end

