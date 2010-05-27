//
//  OCThrottledRequestor.m
//  OmniCamp
//
//  Created by Stephen Prater on 5/27/10.
//  Copyright 2010 A. G. Russell Knives. All rights reserved.
//

#import "OCThrottledRequestor.h"


@implementation OCThrottledRequestor

@synthesize requestDelay;
@synthesize makeRequests;


-(OCThrottledRequestor *)init {
	if (self = [super init]) {
		requestDelay = .3;
		makeRequests = NO;
		requestQueue = [[NSMutableArray alloc] initWithCapacity:2];
		responseQueue = [[NSMutableArray alloc] initWithCapacity:2];
		responseDispatch = [[NSMutableArray alloc] initWithCapacity:2];
		requestTimer = [[NSTimer timerWithTimeInterval:requestDelay target:self selector:@selector(nextInQueue)
			userInfo:nil repeats:YES] retain];
	}
	return self;
}

-(void)dealloc {
	if(requestTimer) {
		[requestTimer invalidate];
	}
	[requestTimer release];
	[responseDispatch release];
	[requestQueue release];
	[responseQueue release];
	[super dealloc];
}

static OCThrottledRequestor *sharedThrottledRequestor = NULL;

+(OCThrottledRequestor *)sharedThrottledRequestor {
	@synchronized(self) {
		if(sharedThrottledRequestor == NULL) {
			sharedThrottledRequestor = [[self alloc] init];
		}
	}
	return (sharedThrottledRequestor);
}

-(void)addRequestToQueue:(NSURLRequest *)request withOwner:(id)owner {
	NSMutableDictionary *reqDict = [NSMutableDictionary dictionaryWithCapacity:2];
	[reqDict setObject:request forKey:@"request"];
	[reqDict setObject:owner forKey:@"owner"];
}
	

-(void)addRequestToQueue:(NSURLRequest *)request {
	[self addRequestToQueue:request withOwner:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSHTTPURLResponse *)response {
	id owner; 
	if(owner = [[responseDispatch objectForKey:connection] objectAtIndex:0]) {
		[owner processResponse:response forRequest:[[responseDispatch objectForKey:connection] objectAtIndex:1]];
	}
	else {
		NSLog(@"hanlding response ourselves!");
	}
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	id owner;
	if(owner = [[responseDispatch objectForKey:connection] objectAtIndex:0]) {
		[owner processData:data forRequest:[[responseDispatch objectForKey:connection] objectAtIndex:1]];
	}
	else {
		[responseQueue addObject:data];
	}
}

-(NSData *)getlastResponse {
	NSData *firstObject = [responseQueue objectAtIndex:0];
	[responseQueue removeObjectAtIndex:0];
	return firstObject;
}
	

-(void)nextInQueue {
	if([requestQueue count] == 0) {
		[self stopQueue];
	}
	else if ([self makeRequests]) {
		NSDictionary *requestDictionary = [requestQueue objectAtIndex:0];
		[requestQueue removeObjectAtIndex:0];
		NSURLRequest *req = [requestDictionary objectForKey:@"request"];
		id owner = [requestDictionary objectForKey:@"owner"];
		NSURLConnection *con = [NSURLConnection connectionWithRequest:req delegate:self];
		// use the connection as the key so we can look it up later.
		[responseDispatch setObject:[NSArray arrayWithObjects:owner, req, nil] forKey:con];
	}
	// do nothing if we still have something to do, but aren't making request for some reason
}

-(void)stopQueue {
	[requestTimer invalidate];
	[requestTimer release];
}

-(void)startQueue {
	if([requestTimer isValid]) {
		// do nothing if we haven't stopped the queue
		return;
	}
	else {
		requestTimer = [[NSTimer timerWithTimeInterval:requestDelay target:self selector:@selector(nextInQueue)
			userInfo:nil repeats:YES] retain];
	}
}
@end
