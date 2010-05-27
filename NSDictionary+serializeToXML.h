//
//  NSDictionary+serializeToXML.h
//  OmniCamp
//
//  Created by Stephen Prater on 5/27/10.
//  Copyright 2010 A. G. Russell Knives. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NSDictionary (serializeToXML)

-(NSXMLDocument *)serializeToXML
-(NSXMLElement *)serializeToXMLFragment

@end

@interface NSArray (serializeToXML)

-(NSXMLDocument *)serializeToXML
-(NSXMLElement *)serializeToXMLFragment

@end