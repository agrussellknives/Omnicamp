//
//  NSDictionary+serializeToXML.m
//  OmniCamp
//
//  Created by Stephen Prater on 5/27/10.
//  Copyright 2010 A. G. Russell Knives. All rights reserved.
//

#import "NSDictionary+serializeToXML.h"
#import "ActiveSupportInflector.h"


@implementation NSDictionary (serializeToXML)

-(NSXMLElement *)serializeToXMLFragmentUsingTagName:(NSString *)elName {
	NSArray *keyList = [self allKeys];
	NSMutableArray *xmlNodes = [NSMutableArray arrayWithCapacity:[keyList count]];
	id key;
	
	for(key in keyList) {
		if([key isEqualToString:@"objectId"]) { continue; }
		NSXMLElement *keyElement = [NSXMLElement elementWithName:key];
		id objToXML = [self objectForKey:key];
		if([objToXML isKindOfClass:[NSDictionary class]]) {
			[keyElement addChild:[objToXML serializeToXMLFragmentUsingTagName:key]];
		}
		else if ([objToXML isKindOfClass:[NSArray class]]) {
			ActiveSupportInflector *aci = [ActiveSupportInflector sharedActiveSupportInflector];
			[keyElement setChildren:[objToXML serializeToXMLFragmentsUsingTagName:[aci singularize:key]]];
		}
		else {
			[keyElement setStringValue:[NSString stringWithFormat:@"%@",objToXML]];
		}
		[xmlNodes addObject:keyElement];
	}
	
	NSXMLElement *dictElement = [NSXMLElement elementWithName:elName];
	[dictElement setChildren:xmlNodes];
	
	return dictElement;
}

-(NSXMLElement *)serializeToXMLFragment {
	NSLog(@"Converted a dict to XML without explicit tag name.  Really?");
	return [self serializeToXMLFragmentUsingTagName:@"item"];
}


-(NSXMLDocument *)serializeToXMLWithRootNamed:(NSString *)rootName {
	NSXMLElement *rootElement = [self serializeToXMLFragmentUsingTagName:rootName];
	NSXMLDocument *xmlDoc = [NSXMLDocument documentWithRootElement:rootElement];
	return xmlDoc;
}

-(NSXMLDocument *)serializeToXML {
	return [self serializeToXMLWithRootNamed:@"root"];
}
@end


@implementation NSArray (serializeToXML)

-(NSArray *)serializeToXMLFragmentsUsingTagName:(NSString *)elName {
	NSMutableArray *xmlNodes = [NSMutableArray arrayWithCapacity:[self count]];
	id obj;
	for(obj in self) {
		NSXMLElement *itemElement = [NSXMLElement elementWithName:elName];
		if([obj isKindOfClass:[NSDictionary class]]) {
			itemElement = [obj serializeToXMLFragmentUsingTagName:elName];
		}
		else if([obj isKindOfClass:[NSArray class]]) {
			// if we have an array within an array, there's no way
			// we can possible know what the "tag" is, so we use "item"
			[itemElement setChildren:[obj serializeToXMLFragments]];
		}
		else {
			[itemElement setStringValue:[NSString stringWithFormat:@"%@",obj]];
		}
		[xmlNodes addObject:itemElement];
	}
	return xmlNodes;
}
		
-(NSArray *)serializeToXMLFragments {
	return [self serializeToXMLFragmentsUsingTagName:@"item"];
}

-(NSXMLDocument *)serializeToXMLWithRootNamed:(NSString *)rootName tagName:(NSString *)elName {
	ActiveSupportInflector *aci = [ActiveSupportInflector sharedActiveSupportInflector];
	NSXMLElement *rootElement = [NSXMLElement elementWithName:rootName];
	[rootElement setChildren:[self serializeToXMLFragmentsUsingTagName:[aci singularize:elName]]];
	
	NSXMLDocument *xmlDoc = [NSXMLDocument documentWithRootElement:rootElement];
	return xmlDoc;
}

-(NSXMLDocument *)serializeToXMLWithRootNamed:(NSString *)rootName {
	return [self serializeToXMLWithRootNamed:rootName tagName:rootName];
}

-(NSXMLDocument *)serializeToXML {
	return [self serializeToXMLWithRootNamed:@"items"];
}

@end