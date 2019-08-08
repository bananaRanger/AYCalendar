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

public extension AYCalendarUIDelegate {
  func headerHeight() -> CGFloat {
    return 50
  }
  
  func backgorundColor() -> UIColor {
    return .white
  }
  
  func padding() -> CGFloat {
    return 0
  }
  
  func monthContentInsets() -> UIEdgeInsets {
    return .zero
  }
  
  func monthDaysSpacing() -> CGFloat {
    return 0
  }
  
  func weekFont() -> UIFont {
    return .systemFont(ofSize: 16, weight: .bold)
  }
  
  func weekTextColor() -> UIColor {
    return .black
  }
  
  func dayFont() -> UIFont {
    return .systemFont(ofSize: 16, weight: .medium)
  }
  
  func pastDaysColor() -> UIColor {
    return .gray
  }
  
  func notCurrentMonthDaysColor() -> UIColor {
    return .groupTableViewBackground
  }
  
  func currentMonthDaysColor() -> UIColor {
    return .black
  }
  
  func selectedDayTextColor() -> UIColor {
    return .white
  }
  
  func badgeHeight() -> CGFloat {
    return 10
  }

  func selectedDayBackgorundColor() -> UIColor {
    return .black
  }
  
  func badgeBackgorundColor() -> UIColor {
    return .gray
  }
  
  func badgeSelectedBackgorundColor() -> UIColor {
    return .groupTableViewBackground
  }
}
