#
# Be sure to run `pod lib lint SHNDStuffs.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SHNDStuffs'
  s.version          = '1.1.3'
  s.summary          = 'Make your UIView, UIButton, UINavigationBar, UIImageView and etc more awesome for your iOS apps.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Install library to your project till you never have to write more code for your objects(UIView and...). This is very simple way to make your UI objects more AWESOME without having too muuch code. Hope you fellas enjoy it ;)
                       DESC

  s.homepage         = 'https://github.com/shndrs/SHNDStuffs'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sahandraeisi1994@gmail.com' => 'sahandraeisi@yahoo.com' }
  s.source           = { :git => 'https://github.com/shndrs/SHNDStuffs.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.swift_version = '4.0'

  s.source_files = 'SHNDStuffs/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SHNDStuffs' => ['SHNDStuffs/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  
  # s.dependency 'AFNetworking', '~> 2.3'
end
