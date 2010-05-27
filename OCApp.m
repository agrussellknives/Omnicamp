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
	NSLog(@"app awoke");
	[theCommunicator setUserName:[[[NSUserDefaultsController sharedUserDefaultsController] values] valueForKey:@"userName"]];
	[theCommunicator setPassWord:[[[NSUserDefaultsController sharedUserDefaultsController] values] valueForKey:@"passWord"]];
	[theCommunicator setUseScripting:[(NSNumber *)[[[NSUserDefaultsController sharedUserDefaultsController] values] valueForKey:@"useScripting"] intValue]];
	
	[self addObserver:self forKeyPath:@"userName" options:NSKeyValueObservingOptionNew context:nil];
	[self addObserver:self forKeyPath:@"passWord" options:NSKeyValueObservingOptionNew context:nil];
	[self addObserver:self forKeyPath:@"useScripting" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
	if([keyPath compare:@"userName"] == NSOrderedSame) {
		[theCommunicator setUserName:[[[NSUserDefaultsController sharedUserDefaultsController] values] valueForKey:@"userName"]];
	}
	else if ([keyPath compare:@"userName"] == NSOrderedSame) {
		[theCommunicator setPassWord:[[[NSUserDefaultsController sharedUserDefaultsController] values] valueForKey:@"passWord"]];
	}
	else if ([keyPath compare:@"useScripting"] == NSOrderedSame) {
		[theCommunicator setUseScripting:[[[NSUserDefaultsController sharedUserDefaultsController] values] boolForKey:@"useScripting"]];
	}
}

@end
