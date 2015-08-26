# CMEqualizerIndicatorView
`CMEqualizerIndicatorView` is an OS X library used to visually indicate the play, pause, or stop state of audio. CMEqualizerIndicatorView is designable in Interface Builder for quicker mockups.

## Getting Started

- [Download CMEqualizerIndicatorView](https://github.com/connor/CMEqualizerIndicatorView/archive/master.zip) and try the included example project.
- Copy the `CMEqualizerIndicatorView` directory into your project
- Import the header file at the top of your document, like so: ```#import "CMEqualizerIndicatorView.h"```

## Using CMEqualizerIndicatorView

Quick demonstration.

```objective-c
CMEqualizerIndicatorView *equalizerIndicatorView = [[CMEqualizerIndicatorView alloc] initWithFrame: CGRectMake(0,0,16,16)];
equlizerIndicatorView.tintColor = [NSColor blueColor];
[equalizerIndicatorView startAnimated:YES]; // audio begins playing
[equalizerIndicatorView pauseAnimated:YES]; // audio is paused
[equalizerIndicatorView stopAnimated:YES]; // audio ends playback
```

There's also an example project in the repo.

## Credits

CMEqualizerView is a fork of [Alex Givens](http://alexgivens.com)'s [AGEqualizerView](https://github.com/AlexGivens/AGEqualizerIndicatorView) for iOS.
