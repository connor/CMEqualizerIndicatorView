Pod::Spec.new do |s|
    s.name                  = "CMEqualizerIndicatorView"
    s.version               = "1.0"
    s.summary               = "Indicator view used to represent the play/pause/stop state of audio, compatible with OS X."
    s.license               = { :type => 'MIT', :file => 'LICENSE' }
    s.homepage              = "https://cnnr.me"
    s.author                = { "Connor Montgomery" => "c@cnnr.me" }
    s.source                = { :git => "https://github.com/connor/CMEqualizerIndicatorView.git", :tag => s.version}
    s.source_files          = 'CMEqualizerIndicatorView/CMEqualizerIndicatorView.{h,m}', 'CMEqualizerIndicatorView/NSView+NSViewAnimationWithBlocks.{h,m}'
    s.public_header_files   = 'CMEqualizerIndicatorView/*.h'
    s.requires_arc          = true
    s.osx.deployment_target = '10.8'
end