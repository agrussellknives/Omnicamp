//
//  NSDictionary+dictFromXML.m
//  OmniCamp
//
//  Created by stephenprater on 6/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "NSDictionary+dictFromXML.h"


@implementation NSDictionary (dictFromXML)

+(NSDictionary *)dictionaryFromXML:(id)XMLIn {
	NSXMLDocument *xml;
	NSMutableDictionary *dict;
	NSError *error = nil;
	if([XMLIn isKindOfClass:[NSData class]]) {
		XMLIn = [[[NSString alloc] initWithData:XMLIn encoding:NSASCIIStringEncoding] autorelease];
	}
	
	if([XMLIn isKindOfClass:[NSString class]]) {
		xml = [[[NSXMLDocument alloc] initWithXMLString:XMLIn options:0 error:&error] autorelease];
	}
	else {
		xml = XMLIn;
	}
	
	// get the root element
	NSXMLElement *root = [xml rootElement];
	NSArray *children = [root children];
	NSXMLElement *child;
	for(child in children) {
		[dict setObject:[child objectValue] forKey:[child name]];
	}
	return dict;
}
@end
