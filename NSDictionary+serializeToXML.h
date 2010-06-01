//
//  NSDictionary+serializeToXML.h
//  OmniCamp
//
//  Created by Stephen Prater on 5/27/10.
//  Copyright 2010 A. G. Russell Knives. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NSDictionary (serializeToXML)

-(NSXMLElement *)serializeToXMLFragmentUsingTagName:(NSString *)elName;
-(NSXMLElement *)serializeToXMLFragmentUsingTagName:(NSString *)elName excluding:(NSArray *)excluding;
-(NSXMLElement *)serializeToXMLFragment;
-(NSXMLDocument *)serializeToXMLWithRootNamed:(NSString *)rootName;
-(NSXMLDocument *)serializeToXML;
-(NSXMLDocument *)serializeToXMLWithRootNamed:(NSString *)rootName excluding:(NSArray *)excluding;

@end

@interface NSArray (serializeToXML)

-(NSArray *)serializeToXMLFragments;
-(NSArray *)serializeToXMLFragmentsUsingTagName:(NSString *)elName;
-(NSXMLDocument *)serializeToXMLWithRootNamed:(NSString *)rootName;
-(NSXMLDocument *)serializeToXMLWithRootNamed:(NSString *)rootName tagName:(NSString *)elName;
-(NSXMLDocument *)serializeToXML;

@end