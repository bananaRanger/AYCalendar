# AYCalendar

[![CI Status](https://img.shields.io/travis/antonyereshchenko@gmail.com/AYCalendar.svg?style=flat)](https://travis-ci.org/antonyereshchenko@gmail.com/AYCalendar)
[![Version](https://img.shields.io/cocoapods/v/AYCalendar.svg?style=flat)](https://cocoapods.org/pods/AYCalendar)
[![License](https://img.shields.io/cocoapods/l/AYCalendar.svg?style=flat)](https://cocoapods.org/pods/AYCalendar)
[![Platform](https://img.shields.io/cocoapods/p/AYCalendar.svg?style=flat)](https://cocoapods.org/pods/AYCalendar)

<p align="center">
  <img width="80%" height="80%" src="https://github.com/bananaRanger/AYCalendar/blob/master/Resources/logo_img.png?raw=true">
</p>

## About

Customizable calendar view controller with navigation through the months.

### Demo

<p align="center">
  <img width="80%" height="80%" src="https://github.com/bananaRanger/AYCalendar/blob/master/Resources/preview.png?raw=true">
</p>

##### Demo video

<p align="center">
  <img width="33%" height="33%" src="https://github.com/bananaRanger/AYCalendar/blob/master/Resources/demo1.mov?raw=true">
  <img width="33%" height="33%" src="https://github.com/bananaRanger/AYCalendar/blob/master/Resources/demo2.mov?raw=true">
  <img width="33%" height="33%" src="https://github.com/bananaRanger/AYCalendar/blob/master/Resources/demo3.mov?raw=true">
</p>


## Installation

AYCalendar is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
inhibit_all_warnings!

target 'YOUR_TARGET_NAME' do
  use_frameworks!
	pod 'AYCalendar'
end
```

## Usage

```swift
// 'calendarDelegate' - object that conform to protocol 'AYCalendarDelegate'.
// 'calendarUIDelegate' - object that conform to protocol 'AYCalendarUIDelegate'.
// 'calendarDataSource' - object that conform to protocol 'AYCalendarDataSource'.

let calendar = AYCalendarViewController()

calendar.delegate = calendarDelegate
calendar.uiDelegate = calendarUIDelegate
calendar.dataSource = calendarDataSource

present(calendar, animated: true, completion: nil)
```

#### AYCalendarUIDelegate

<p align="center">
  <img width="100%" height="100%" src="https://github.com/bananaRanger/AYCalendar/blob/master/Resources/UIDelegate.png?raw=true">
</p>

## Author

Anton Yereshchenko

## License

AYCalendar is available under the MIT license. See the LICENSE file for more info.

#### Used dependencies

nkopilovskii/NKGridTemplate - https://github.com/nkopilovskii/NKGridTemplate

nkopilovskii/NKSlideScreensTemplate - https://github.com/nkopilovskii/NKSlideScreensTemplate

#### Icons:

Icons8 - https://icons8.com
