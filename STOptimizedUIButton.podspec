#
# Be sure to run `pod lib lint STOptimizedUIButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "STOptimizedUIButton"
  s.version          = "0.1.0"
  s.summary          = "A custom UIButton class to get a nice looking UIButton with Bounce-Effects and IBDesignable support"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
                        Simply add the STOptimizedButton to your UIButton as a custom class in your Storyboard and customize it.
                       DESC

  s.homepage         = "https://github.com/SvenTiigi/STOptimizedUIButton"
  s.license          = 'MIT'
  s.author           = { "SvenTiigi" => "sven@tiigi.de" }
  s.source           = { :git => "https://github.com/SvenTiigi/STOptimizedUIButton.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'STOptimizedUIButton' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
