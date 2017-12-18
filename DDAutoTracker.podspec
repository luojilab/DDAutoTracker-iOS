#
# Be sure to run `pod lib lint DDAutoTracker.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DDAutoTracker'
  s.version          = '0.1.0'
  s.summary          = '轻量级无痕埋点解决方案'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = '无埋点方案主要依靠AOP（Aspect Oriented Programming）面向切片编程，通过预编译方式和运行期动态代理针对业务处理过程的实体及其属性和行为进行抽象封装，以获得更加清晰高效的逻辑单元划分。'

  s.homepage         = 'https://gitlab.luojilab.com/iget-iOS/DDAutoTracker'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wanghailiang' => 'wanghailiang@luojilab.com' }
  s.source           = { :git => 'https://gitlab.luojilab.com/iget-iOS/DDAutoTracker.git', :tag => 'v' + s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'DDAutoTracker/Classes/*.{h,m}'
  s.public_header_files = 'DDAutoTracker/Classes/*.h'

  # s.resource_bundles = {
  #   'DDAutoTracker' => ['DDAutoTracker/Assets/*.png']
  # }

  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
