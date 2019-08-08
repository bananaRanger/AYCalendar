#
# Be sure to run `pod lib lint AYCalendar.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AYCalendar'
  s.version          = '1.0.0'
  s.summary          = 'AYCalendarViewController - is a customizable calendar view controller.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Customizable calendar view controller with navigation through the months.
                       DESC

  s.homepage         = 'https://github.com/antonyereshchenko@gmail.com/AYCalendar'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Anton Yereshchenko' => 'antonyereshchenko@gmail.com' }
  s.source           = { :git => 'https://github.com/bananaRanger/AYCalendar.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  s.swift_version  = '5.0'

  s.source_files = 'AYCalendar/Classes/**/*'
  
  s.dependency 'NKGridTemplate', '~> 0.1.0.1'
  s.dependency 'NKSlideScreensTemplate', '~> 0.1.0'

end
