//
//  ViewController.m
//  Example
//
//  Created by Connor Montgomery on 26/08/2015.
//  Copyright (c) 2015 Connor Montgomery. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.equalizerView startAnimated:YES];

    /*
        
        To add programmatically instead of via IB, do the following:
     
     1. add a @property for the CMEqualizerView
     2. alloc/init it:
        self.equalizerView = [[CMEqualizerView alloc] initWithFrame:myFrame];
     3. add it as a subview:
        [self.view addSubview:self.equalizerView];

     */
}

- (IBAction)didClickButton:(id)sender {
    NSButton *button = (NSButton *)sender;
    if ([button.title isEqualToString:@"Pause"]) {
        [self.equalizerView pauseAnimated:YES];
        button.title = @"Play";
    } else {
        [self.equalizerView startAnimated:YES];
        button.title = @"Pause";
    }
}

@end
