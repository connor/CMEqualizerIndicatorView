//
//  CMEqualizerIndicatorView.h
//
//  Created by Connor Montgomery on 8/26/15.
//  Copyright (c) 2015 Connor Montgomery. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NSView+NSViewAnimationWithBlocks.h"

IB_DESIGNABLE

@interface CMEqualizerIndicatorView : NSView

/**
Must contain an array of NSNumbers between 0.0 and 1.0. The count of this array determines how many bars will draw.
 */
@property (nonatomic, strong) NSArray *barPositions;

/**
Seed the equalizer view with a beat-per-minute integer to alter animation speeds.
 */
@property (nonatomic, strong) IBInspectable NSNumber *bpm;

/**
Background color
 */
@property (nonatomic, strong) IBInspectable NSColor *tintColor;


@property (nonatomic) IBInspectable NSInteger barSpacing;

- (id)initWithFrame:(CGRect)frame barPositions:(NSArray *)barPositions BPM:(NSNumber *)bpm;

- (void)startAnimated:(BOOL)animated;
- (void)pauseAnimated:(BOOL)animated;
- (void)stopAnimated:(BOOL)animated;

@end
