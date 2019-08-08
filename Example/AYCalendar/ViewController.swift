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
import AYCalendar

class ViewController: UIViewController {
  var cellBack = UIColor(red: 242.0/255.0, green: 163.0/255.0, blue: 181.0/255.0, alpha: 1.0)
  var cellText = UIColor(red: 237.0/255.0, green: 107.0/255.0, blue: 134.0/255.0, alpha: 1.0)
  var cellBadge = UIColor.white

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    let calendar = AYCalendarViewController()

    calendar.delegate = self
    calendar.uiDelegate = self
    calendar.dataSource = self
    
    calendar.monthNavigationView?.backgroundColor = .black
    calendar.monthNavigationView?.lblText.textColor = .white
    calendar.monthNavigationView?.btnNext.backgroundColor = .white
    calendar.monthNavigationView?.btnPrev.backgroundColor = .white
    
    calendar.monthNavigationView?.layer.cornerRadius = 8
    calendar.monthNavigationView?.layer.shadowRadius = 10
    calendar.monthNavigationView?.layer.shadowOpacity = 0.32
    
    calendar.calendarSlides.backgroundColor = .white
    
    calendar.calendarSlides.layer.shadowColor = UIColor.white.cgColor
    calendar.calendarSlides.layer.cornerRadius = 8
    calendar.calendarSlides.layer.shadowRadius = 10
    calendar.calendarSlides.layer.shadowOpacity = 0.25
    
    present(calendar, animated: true, completion: nil)
  }
}

extension ViewController: AYCalendarUIDelegate, AYCalendarDelegate, AYCalendarDataSource {
  
  func monthContentInsets() -> UIEdgeInsets {
    return UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16)
  }
  
  func padding() -> CGFloat {
    return 32
  }
  
  func selectedDayTextColor() -> UIColor {
    return cellText
  }
  
  func selectedDayBackgorundColor() -> UIColor {
    return cellBack
  }
  
  func badgeBackgorundColor() -> UIColor {
    return cellBack
  }
  
  func badgeSelectedBackgorundColor() -> UIColor {
    return cellBadge
  }
  
  func backgorundColor() -> UIColor {
    return cellBack
  }
  
  func badges() -> [Date] {
    return [Date(timeIntervalSince1970: 1566205810)]
  }
  
  func badgeHeight() -> CGFloat {
    return 5
  }
  
  func dayFont() -> UIFont {
    return UIFont.systemFont(ofSize: 16, weight: .black)
  }
  
  func didSelect(date: Date?, on calendar: AYCalendarViewController) {
    let alert = UIAlertController(
      title: nil,
      message: "You have selected \(date?.log ?? "-")",
      preferredStyle: .actionSheet)
    
    let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    alert.addAction(cancel)
    calendar.present(alert, animated: true, completion: nil)
  }
  
  func didPresent(calendar: AYCalendarViewController, with date: Date?) {

  }
  
}
