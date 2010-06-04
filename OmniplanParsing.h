/*
 *  OmniplanParsing.h
 *  OmniCamp
 *
 *  Created by Stephen Prater on 5/27/10.
 *  Copyright 2010 A. G. Russell Knives. All rights reserved.
 *
 */
 
@class OCCommunicator;
 
@protocol OmniplanParsing <NSObject>

-(NSMutableDictionary *)decodeOmniPlan:(id)thePlan;
-(void)encodeBasecamp:(NSDictionary *)planDict;
-(void)reset;

@property (copy) NSString *filePath;
@property (nonatomic,assign) OCCommunicator *communicator;
 
@end

