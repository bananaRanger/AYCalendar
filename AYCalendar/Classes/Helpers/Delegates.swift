// MIT License
//
// Copyright (c) 2019 Anton Yereshchenko
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit

//MARK: AYCalendarUIDelegate protocol
public protocol AYCalendarUIDelegate: class {
  func headerHeight() -> CGFloat
  func backgorundColor() -> UIColor
  func padding() -> CGFloat
  
  func monthContentInsets() -> UIEdgeInsets
  func monthDaysSpacing() -> CGFloat

  func weekFont() -> UIFont
  func weekTextColor() -> UIColor

  func dayFont() -> UIFont
  func pastDaysColor() -> UIColor
  func notCurrentMonthDaysColor() -> UIColor
  func currentMonthDaysColor() -> UIColor
  func selectedDayTextColor() -> UIColor
  func selectedDayBackgorundColor() -> UIColor
  
  func badgeHeight() -> CGFloat
  func badgeBackgorundColor() -> UIColor
  func badgeSelectedBackgorundColor() -> UIColor
}

//MARK: AYCalendarDelegate protocol
public protocol AYCalendarDelegate: class {
  func calendarDidPresent(with date: Date?)
  func didSelect(date: Date?)
}

//MARK: AYCalendarDataSource protocol
public protocol AYCalendarDataSource: class {
  func date() -> Date
  func locale() -> Locale
  func badges() -> [Date]
  func weekdayNameDisplayType() -> AYNameDisplayType
}
