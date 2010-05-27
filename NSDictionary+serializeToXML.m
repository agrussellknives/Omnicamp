//
//  NSDictionary+serializeToXML.m
//  OmniCamp
//
//  Created by Stephen Prater on 5/27/10.
//  Copyright 2010 A. G. Russell Knives. All rights reserved.
//

#import "NSDictionary+serializeToXML.h"


@implementation NSDictionary (serializeToXML)

-(NSXMLElement *)serializeToXMLFragment {
	NSArray *keyList = [self allKeys];
	NSArray *xmlNodeNames = [NSMutableArray arrayWithCapacity:[keyList count]];
	id key;
	
	for(key in keyList) {
		if([[self objectForKey:key] isKindOfClass:[NSDictionary class]]) {
			[key serializeToXMLFragment];
		}
		else {
			if(![key isKindOfClass:[NSString class]]) {
				NSLog(@"can't serialize with not string keys");
			}
			NSXMLElement *keyElement = [NSXMLElement elementWithName:key];
			id objToXML = [self objectForKey:key];
			if([objToXML isKindOfClass:[NSArray class]]) {
				// for arrays, we put them in "<item>" containers
				// which is handled by the array category in this file
				// we set the name of those containers using the string inflector category
				[keyElement setChildren:[objToXML seralizeToXMLFragmentUsingName:key]]
			}
			
			
			
	

@end

@implementation NSArray (serializeToXML)

-(NSXMLElement *)serializeToXMLFragmentsUsingTagName:(NSString *)elName {
	NSArray *xmlNodes;
	id obj;
	for(obj in self) {
		NSXMLElement *itemElement = [NSXMLElement elementWithName:elName];
		if([obj isKindOfClass:[NSDictionary class]]) {
			[itemElement addChild:[obj serializeToXMLFragment]];
		}
		if([obj isKindOfClass:[NSArray class]]) {
			// if we have an array within an array, there's no way
			// we can possible know what the "tag" is, so we use "item"
			[itemElement setChildren:[obj serializeToXMLFragment]];
		}
		else {
			[itemElement setStringValue:[NSString stringWithFormat:@"%@",obj]];
		}
		[xmlNodes addObject:itemElement];
	}
}
		
-(NSXMLElement *)serializeToXMLFragments {
	return [self serializeToXMLFragmentUsingName:@"item"];
}

@end