//
//  AppDelegate.m
//  Example
//
//  Created by Connor Montgomery on 26/08/2015.
//  Copyright (c) 2015 Connor Montgomery. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate()
@property (nonatomic,strong) IBOutlet ViewController *viewController;
@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    [self.window.contentView addSubview:self.viewController.view];
    self.viewController.view.frame = ((NSView*)self.window.contentView).bounds;
}

@end
