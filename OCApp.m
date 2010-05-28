//
//  OCApp.m
//  OmniCamp
//
//  Created by Stephen Prater on 5/24/10.
//  Copyright 2010 A. G. Russell Knives. All rights reserved.
//

#import "OCApp.h"


@implementation OCApp

- (void)awakeFromNib {
	[[NSUserDefaults standardUserDefaults] registerDefaults:
		[[[NSDictionary alloc] initWithContentsOfFile:
			[[NSBundle mainBundle] pathForResource:@"defaults" ofType:@"plist"]
		 ] autorelease]
	 ];
	[theCommunicator setUserName:[[[NSUserDefaultsController sharedUserDefaultsController] values] valueForKey:@"userName"]];
	[theCommunicator setPassWord:[[[NSUserDefaultsController sharedUserDefaultsController] values] valueForKey:@"passWord"]];
	[theCommunicator setBasecampURL:[[[NSUserDefaultsController sharedUserDefaultsController] values] valueForKey:@"basecampURL"]];
	[theCommunicator setUseScripting:[(NSNumber *)[[[NSUserDefaultsController sharedUserDefaultsController] values] valueForKey:@"useScripting"] intValue]];
	[theCommunicator setTrackTime:[(NSNumber *)[[[NSUserDefaultsController sharedUserDefaultsController] values] valueForKey:@"trackTime"] intValue]];
	[theCommunicator setNotifyAssignees:[(NSNumber *)[[[NSUserDefaultsController sharedUserDefaultsController] values] valueForKey:@"notifyAssignees"] intValue]];
	
	[self addObserver:self forKeyPath:@"basecampURL" options:NSKeyValueObservingOptionNew context:nil];
	[self addObserver:self forKeyPath:@"userName" options:NSKeyValueObservingOptionNew context:nil];
	[self addObserver:self forKeyPath:@"passWord" options:NSKeyValueObservingOptionNew context:nil];
	[self addObserver:self forKeyPath:@"useScripting" options:NSKeyValueObservingOptionNew context:nil];
	[self addObserver:self forKeyPath:@"trackTime" options:NSKeyValueObservingOptionNew context:nil];
	[self addObserver:self forKeyPath:@"notifyAssignees" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
	NSLog(keyPath);
	if([keyPath compare:@"userName"] == NSOrderedSame) {
		[theCommunicator setUserName:[[[NSUserDefaultsController sharedUserDefaultsController] values] valueForKey:@"userName"]];
	}
	else if ([keyPath compare:@"userName"] == NSOrderedSame) {
		[theCommunicator setPassWord:[[[NSUserDefaultsController sharedUserDefaultsController] values] valueForKey:@"passWord"]];
	}
	else if ([keyPath compare:@"basecampURL"] == NSOrderedSame) {
		[theCommunicator setBasecampURL:[[[NSUserDefaultsController sharedUserDefaultsController] values] valueForKey:@"basecampURL"]];
	}
	else if ([keyPath compare:@"useScripting"] == NSOrderedSame) {
		NSLog(@"setting useScripting");
		[theCommunicator setUseScripting:[(NSNumber *)[[[NSUserDefaultsController sharedUserDefaultsController] values] valueForKey:@"useScripting"] intValue]];
	}
	else if ([keyPath compare:@"trackTime"] == NSOrderedSame) {
		[theCommunicator setTrackTime:[(NSNumber *)[[[NSUserDefaultsController sharedUserDefaultsController] values] valueForKey:@"trackTime"] intValue]];
	}
	else if ([keyPath compare:@"notifyAssignees"] == NSOrderedSame) {
		NSLog(@"setting notifyAssignees");
		[theCommunicator setNotifyAssignees:[(NSNumber *)[[[NSUserDefaultsController sharedUserDefaultsController] values] valueForKey:@"notifyAssignees"] intValue]];
	}
}

@end
