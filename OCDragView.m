//
//  OCDragView.m
//  OmniCamp
//
//  Created by Stephen Prater on 5/24/10.
//  Copyright 2010 A. G. Russell Knives. All rights reserved.
//

#import "OCDragView.h"
#import "OCCommunicator.h";


@implementation OCDragView

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        types = [[NSArray alloc] initWithObjects:NSFilenamesPboardType,NSURLPboardType,nil];
		[self registerForDraggedTypes:types];
    }
    return self;
}

- (void)dealloc {
	[self unregisterDraggedTypes];
	[types release];
	[super dealloc];
}

- (void)drawRect:(NSRect)rect {
    // Drawing code here.
}

- (NSDragOperation)draggingEntered:(id <NSDraggingInfo>)sender {
	// safari returns NSDragOperationAll_Obselete instead of "every" here, so we have
	// to look for it to.
	if((NSDragOperationAll_Obsolete & [sender draggingSourceOperationMask]) || (NSDragOperationEvery & [sender draggingSourceOperationMask])){
		NSLog(@"returning generic");
		return NSDragOperationGeneric;
	}
	else {
		NSLog(@"returning none");
		return NSDragOperationNone;
	}
}

-(BOOL)prepareForDragOperation:(id <NSDraggingInfo>)sender {
	NSLog(@"called prepare");
	// do not accept drag unless username and password are set to SOMETHING.
	if([theCommunicator userName] && [theCommunicator passWord]) {
		return YES;
	}
	
	if([theCommunicator inProcess]) {
		//reject if we'ere currently uploading;
		return NO;
	}
	
	NSRunAlertPanel(@"Basecamp Error",@"You have to set the Basecamp Username and Password before using OmniCamp",
		nil,nil,nil);
	return NO;
}

- (BOOL)performDragOperation:(id <NSDraggingInfo>)sender {
	NSPasteboard *paste = [sender draggingPasteboard];
	
	NSString *desiredType = [paste availableTypeFromArray:types];
	NSData *carriedData = [paste dataForType:desiredType];
	
	NSError *error = nil;
	
	if(nil == carriedData) {
		NSRunAlertPanel(@"Paste Error", @"Sorry, but the drag operation failed.",nil, nil, nil);
		return NO;
	}
	else {
		if([desiredType isEqualToString:NSFilenamesPboardType]) {
			// we only operate on the first file
			NSString *path = [[paste propertyListForType:@"NSFilenamesPboardType"] objectAtIndex:0];
			[theCommunicator setFilePath:path];
			[theCommunicator postToBasecamp:path error:&error];
		}
		if([desiredType isEqualToString:NSURLPboardType]) {
			NSLog(@"not implemented yet");
		}
	}
	return NO;
}	
	

@end
