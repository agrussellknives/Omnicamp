//
//  OCDragView.h
//  OmniCamp
//
//  Created by Stephen Prater on 5/24/10.
//  Copyright 2010 A. G. Russell Knives. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "OCCommunicator.h"

@interface OCDragView : NSView {
	IBOutlet OCCommunicator *theCommunicator;
	NSArray *types;
}

@end
