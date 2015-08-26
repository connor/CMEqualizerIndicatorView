//
//  CMEqualizerIndicatorView.m
//
//  Created by Connor Montgomery on 8/26/15.
//  Copyright (c) 2015 Connor Montgomery. All rights reserved.
//

#import "CMEqualizerIndicatorView.h"

#define kEqualizerBarPadding 1.5
#define kEqualizerAnimationDuration 0.25

@interface CMEqualizerIndicatorView()

@property (nonatomic, strong) NSArray *barArray;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation CMEqualizerIndicatorView

- (void)commonInit
{
    self.wantsLayer = YES;
    [self setDefaultValues];
    [self generateBars];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame barPositions:(NSArray *)barPositions BPM:(NSNumber *)bpm {
    self = [super initWithFrame:frame];
    if (self) {
        _bpm = bpm;
        _barPositions = barPositions;
        [self generateBars];
    }
    return self;
}

- (void)setDefaultValues {
    _tintColor = [NSColor blackColor];
    _bpm = @100;
    _barPositions = @[@0.7,
                      @0.8,
                      @0.3];
}

- (void)setBpm:(NSNumber *)bpm {
    _bpm = [NSNumber numberWithFloat:MIN(160, MAX(60, [bpm floatValue]))];
}

- (void)setBarPositions:(NSArray *)barPositions {
    _barPositions = barPositions;
}

- (void)generateBars {

    NSMutableArray *tempBarArray = [NSMutableArray arrayWithCapacity:self.barPositions.count];
    float barWidth = (self.bounds.size.width - (kEqualizerBarPadding * 3)) / self.barPositions.count;

    for (int idx=0; idx < self.barPositions.count; idx++)  {

        float barXCoordinate = idx * barWidth + idx * kEqualizerBarPadding;
        CGRect barFrame = CGRectMake(barXCoordinate, 0, barWidth, 0);

        NSImageView *barView = [[NSImageView alloc] initWithFrame:barFrame];

        barView.wantsLayer = YES;
        barView.layer.backgroundColor = _tintColor.CGColor;

        [self addSubview:barView];

        [tempBarArray addObject:barView];
    }

    _barArray = [NSArray arrayWithArray:tempBarArray];

    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_2*2);
    self.layer.affineTransform = transform;
}

- (void)startAnimated:(BOOL)animated {

    if (!animated) [self setAllBarsAtPauseHeights];

    if (![_timer isValid]){
        _timer = [NSTimer scheduledTimerWithTimeInterval:kEqualizerAnimationDuration
                                                  target:self
                                                selector:@selector(ticker)
                                                userInfo:nil
                                                 repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
}

- (void)pauseAnimated:(BOOL)animated {
    [self killTimers];

    if (animated) {
        [NSView animateWithDuration:kEqualizerAnimationDuration
                         animations: ^{
                             [self setAllBarsAtPauseHeights];
                         }];
    } else {
        [self setAllBarsAtPauseHeights];
    }
}

- (void)stopAnimated:(BOOL)animated {
    [self killTimers];

    if (animated) {
        [NSView animateWithDuration:kEqualizerAnimationDuration
                         animations: ^{
                             [self setAllBarsAtZero];
                         }];
    } else {
        [self setAllBarsAtZero];
    }
}

- (void)ticker {

    for (NSImageView *barView in _barArray) {
        [NSAnimationContext beginGrouping];
        [[NSAnimationContext currentContext] setDuration:kEqualizerAnimationDuration];
        CGRect rect = barView.frame;
        int frameHeight = self.frame.size.height;
        int baselineHeight = frameHeight * 0.2;
        int modifiedHeight = baselineHeight + (arc4random() % frameHeight * 0.8 + 1);
        rect.size.height = modifiedHeight;
        barView.animator.frame = rect;
        [NSAnimationContext endGrouping];
    }
}

- (void)setAllBarsAtZero {
    for (NSImageView *barView in _barArray) {
        CGRect rect = barView.frame;
        rect.size.height = 0;
        barView.frame = rect;
    }
}

- (void)setAllBarsAtPauseHeights {

    for (int idx = 0; idx < self.barPositions.count; idx++) {

        NSImageView *barView = [_barArray objectAtIndex:idx];
        NSNumber *pausePosition = [_barPositions objectAtIndex:idx];

        CGRect rect = barView.frame;
        rect.size.height = [pausePosition floatValue] * self.bounds.size.height;
        barView.frame = rect;

    }
}

- (void)setTintColor:(NSColor *)tintColor
{
    _tintColor = tintColor;
    [self generateBars];
}

- (void)killTimers {
    if ([_timer isValid]) {
        [_timer invalidate];
        _timer = nil;
    }
}

#if TARGET_INTERFACE_BUILDER

- (void)drawRect:(CGRect)rect {
    [self.tintColor set];
    NSRectFill(NSMakeRect(0.0, 0.0, self.frame.size.width, self.frame.size.height));
}

#endif

@end
