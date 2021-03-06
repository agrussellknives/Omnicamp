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
@synthesize delegate;


-(OCThrottledRequestor *)init {
	if (self = [super init]) {
		requestDelay = .3;
		makeRequests = NO;
		requestQueue = [[NSMutableArray alloc] initWithCapacity:2];
		responseQueue = [[NSMutableArray alloc] initWithCapacity:2];
		responseDispatch = [[NSMapTable alloc] 
			initWithKeyOptions:NSPointerFunctionsStrongMemory|NSPointerFunctionsObjectPointerPersonality
			valueOptions:NSPointerFunctionsStrongMemory|NSPointerFunctionsObjectPointerPersonality
			capacity:2];
		requestTimer = [[NSTimer scheduledTimerWithTimeInterval:requestDelay target:self selector:@selector(nextInQueue:)
			userInfo:nil repeats:YES] retain];
		[requestTimer invalidate]; // we immediately invalidate our timer so that we don't make any requests until we are asked to start.
		// we do this because it needs to be a valid NSTimer object at all times to support arbitraty stop / start.
	}
	return self;
}

-(void)dealloc {
	[requestTimer invalidate];
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
	[requestQueue addObject:reqDict];
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
		int status = [response statusCode];
		if((status-200) > 100) {
			NSRunAlertPanel(@"Response Error", 
			[NSString stringWithFormat:@"We got a status %d from a generally handled request.",status],
			nil, nil, nil);
		}
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

// start queue without a timer
-(void)nextInQueue {
	[self startQueue:nil];
}
-(void)nextInQueue:(NSTimer *)timer {
	if([requestQueue count] == 0) {
		[self stopQueue];
		if(delegate) {
			[delegate throttledRequestorDidEmptyQueue:self];
		}
		else {
			[self throttledRequestorDidEmptyQueue:self];
		}
	}
	else if ([self makeRequests]) {
		NSDictionary *requestDictionary = [requestQueue objectAtIndex:0];
		[requestDictionary retain]; // we make sure we don't lose our reference until we're done.
		[requestQueue removeObjectAtIndex:0];
		NSURLRequest *req = [requestDictionary objectForKey:@"request"];
		id owner = [requestDictionary objectForKey:@"owner"];
		NSURLConnection *con = [NSURLConnection connectionWithRequest:req delegate:self];
		// use the connection as the key so we can look it up later.
		[responseDispatch setObject:[NSArray arrayWithObjects:owner, req, nil] forKey:con];
		[requestDictionary release]; //okay, we're finished with you now.
	}
	// do nothing if we still have something to do, but aren't making request for some reason
}

-(void)stopQueue {
	[self setMakeRequests:NO];
	[requestTimer invalidate];
}

-(void)resumeAfter:(double)delay {
	// wait <delay> seconds before resuming the queue
	[NSTimer scheduledTimerWithTimeInterval:delay target:self selector:@selector(startQueue:)
		userInfo:nil repeats:NO];
}

/* start queue without a timer */
-(void)startQueue {
	[self startQueue:nil];
}

-(void)clearAndStopQueue {
	[self stopQueue];
	[self setMakeRequests:NO];
	[requestQueue removeAllObjects];
	// cancel remaining connections;
	NSEnumerator *cons = [responseDispatch keyEnumerator];
	
	for(NSURLConnection *con in cons) {
		[con cancel];
	}
	[responseDispatch removeAllObjects];
	[responseQueue removeAllObjects];
}

-(void)startQueue:(NSTimer *)timer {
	if([requestTimer isValid]) {
		// do nothing if we haven't stopped the queue
		if(![self makeRequests]) {
			[self setMakeRequests:YES];
		}
		return;
	}
	else {
		// restart the queue.
		[self setMakeRequests:YES];
		[requestTimer release];
		requestTimer = [[NSTimer scheduledTimerWithTimeInterval:requestDelay target:self selector:@selector(nextInQueue:)
			userInfo:nil repeats:YES] retain];
	}
}

-(void)throttledRequestorDidEmptyQueue:(OCThrottledRequestor *)requestor {
	NSLog(@"%@ emptied it's queue",self);
}
@end
