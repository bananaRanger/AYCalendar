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

import Foundation

//MARK: AYNameDisplayType enum
public enum AYNameDisplayType: Int {
  case fully
  case short
  case veryShort
}

//MARK: AYDateManager class
struct AYDateManager {
  
  //MARK: - properies
  let date: Date
  let locale: Locale?
  
  //MARK: - inits
  init(with date: Date?, locale: Locale? = nil) {
    self.date = date ?? Date()
    self.locale = locale
  }
  
  //MARK: - methods
  static func dates(between lhs: Date, and rhs: Date) -> [Date] {
    if lhs < rhs {
      return Date.dates(from: lhs, to: rhs)
    } else {
      return Date.dates(from: rhs, to: lhs)
    }
  }
  
  static func datesForMonth(in date: Date?, includesPastAndPrevMonthsDays: Bool = false) -> [Date] {
    guard let startOfMonth = date?.startOfMonth,
      let endOfMonth = date?.endOfMonth else { return [] }

    if includesPastAndPrevMonthsDays {
      guard let start = startOfMonth.startOfWeek,
        let end = endOfMonth.endOfWeek else { return [] }
      return dates(between: start, and: end)
    }
    
    return dates(between: startOfMonth, and: endOfMonth)
  }
  
  static func monthNames(with type: AYNameDisplayType? = .veryShort, locale: Locale?) -> [String] {
    let type = type ?? .veryShort

    let formatter = DateFormatter()
    formatter.locale = locale ?? .current
    
    switch type {
    case .fully: return formatter.standaloneMonthSymbols
    case .short: return formatter.shortStandaloneMonthSymbols
    case .veryShort: return formatter.veryShortStandaloneMonthSymbols
    }
  }
  
  static func weekdayNames(with type: AYNameDisplayType?, locale: Locale?) -> [String] {
    let type = type ?? .veryShort

    let formatter = DateFormatter()
    formatter.locale = locale ?? .current
    
    switch type {
    case .fully: return formatter.standaloneWeekdaySymbols
    case .short: return formatter.shortStandaloneWeekdaySymbols
    case .veryShort: return formatter.veryShortStandaloneWeekdaySymbols
    }
  }
  
  func monthName(with type: AYNameDisplayType = .veryShort) -> String {
    let months = AYDateManager.monthNames(with: type, locale: locale ?? .current)
    return months[date.month - 1]
  }
  
  func weekdayName(with type: AYNameDisplayType = .veryShort) -> String {
    let weekdays = AYDateManager.weekdayNames(with: type, locale: locale ?? .current)
    return weekdays[date.weekday - 1]
  }
  
}
