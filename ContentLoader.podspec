#
# Be sure to run `pod lib lint ContentLoader.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  
  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  
  s.platform = :ios
  s.ios.deployment_target = '10.0'
  s.name              = 'ContentLoader'
  s.summary           = 'Create an animated placeholder loading to your content like Slack, Instagram, or even Facebook.'
  s.description       = 'Use ContentLoader to display awesome animated placeholder loading to your content. Use your custom views to generate low-contrast blocks, with the same shapes, positions. Make beautiful animations using your own format as Slack, Instagram, or Facebook does.'
  s.version           = '1.1.0'
  
  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  
  s.license           = { :type => 'MIT', :file => 'LICENSE' }
  
  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  
  s.author            = { 'Alberto Aznar' => 'info@alberdev.com' }
  s.homepage          = 'https://github.com/alberdev/ContentLoader'
  s.social_media_url  = 'https://twitter.com/alberdev'
  
  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  
  s.source            = { :git => 'https://github.com/alberdev/ContentLoader.git', :tag => s.version.to_s }
  
  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  
  s.framework         = 'UIKit'
  
  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  
  s.source_files      = 'ContentLoader/**/*'
  
  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  
  # s.resources         = 'ContentLoader/Resources/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}'
  
  # ――― Swift Version ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  
  s.swift_version     = '5.0'
  
  
end
