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

//MARK: AYCalendarViewController
public class AYCalendarViewController: UIViewController {
  
  //MARK: - properies
  private var headerHeight: CGFloat {
    return uiDelegate?.headerHeight() ?? 50
  }
  
  private var padding: CGFloat {
    return uiDelegate?.padding() ?? 0
  }
  
  private var date: Date {
    return dataSource?.date() ?? Date()
  }
  
  public weak var uiDelegate: AYCalendarUIDelegate?
  public weak var delegate: AYCalendarDelegate?
  public weak var dataSource: AYCalendarDataSource?

  public var monthNavigationView = AYMonthNavigationView.instanceFromNib()
  
  public lazy var calendarSlides: UIView = {
    return calendarSlidesViewController.view
  }()
  
  private lazy var calendarSlidesViewController: AYCalendarSlidesViewController = {
    let viewController = AYCalendarSlidesViewController.calendar(date: date)
    viewController.presenterDelegate = self
    return viewController
  }()
  
  //MARK: - methods
  public override func viewDidLoad() {
    super.viewDidLoad()
        
    view.backgroundColor = uiDelegate?.backgorundColor() ?? .white

    guard let monthNavigationView = monthNavigationView else { return }
    view.addSubview(monthNavigationView)
    view.addAnchorsWithFixedHeight(
      headerHeight,
      to: monthNavigationView,
      with: padding)
    
    monthNavigationView.btnPrev.addTarget(
      self,
      action: #selector(btnPrevMonthTouchUpInside(_:)),
      for: .touchUpInside)
    
    monthNavigationView.btnNext.addTarget(
      self,
      action: #selector(btnNextMonthTouchUpInside(_:)),
      for: .touchUpInside)
    
    view.addSubview(calendarSlides)
    view.addAnchorsForRelatedTopView(
      monthNavigationView,
      for: calendarSlides,
      with: padding)
  }
}

//MARK: - IBActions
extension AYCalendarViewController {
  @IBAction func btnNextMonthTouchUpInside(_ sender: UIButton) {
    calendarSlidesViewController.goToNextPage()
  }
  
  @IBAction func btnPrevMonthTouchUpInside(_ sender: UIButton) {
    calendarSlidesViewController.goToPrevPage()
  }
}

//MARK: - Implementation of AYMonthCalendarDelegate
extension AYCalendarViewController: AYMonthCalendarDelegate {
  func monthContentInsets() -> UIEdgeInsets {
    return uiDelegate?.monthContentInsets() ?? .zero
  }
  
  func monthVerticalSpacing() -> CGFloat {
    return uiDelegate?.monthDaysSpacing() ?? 0
  }
  
  func monthHorizontalSpacing() -> CGFloat {
    return uiDelegate?.monthDaysSpacing() ?? 0
  }
  
  func weekFont() -> UIFont {
    return uiDelegate?.weekFont() ?? .systemFont(ofSize: 16)
  }
  
  func weekTextColor() -> UIColor {
    return uiDelegate?.weekTextColor() ?? .black
  }
  
  func dayFont() -> UIFont {
    return uiDelegate?.dayFont() ?? .systemFont(ofSize: 16)
  }
  
  func pastDaysColor() -> UIColor {
    return uiDelegate?.pastDaysColor() ?? .gray
  }
  
  func notCurrentMonthDaysColor() -> UIColor {
    return uiDelegate?.notCurrentMonthDaysColor() ?? .groupTableViewBackground
  }
  
  func currentMonthDaysColor() -> UIColor {
    return uiDelegate?.currentMonthDaysColor() ?? .black
  }
  
  func selectedDayTextColor() -> UIColor {
    return uiDelegate?.selectedDayTextColor() ?? .white
  }
  
  func selectedDayBackgorundColor() -> UIColor {
    return uiDelegate?.selectedDayBackgorundColor() ?? .black
  }
  
  func badgeHeight() -> CGFloat {
    return uiDelegate?.badgeHeight() ?? 8
  }

  func badgeBackgorundColor() -> UIColor {
    return uiDelegate?.badgeBackgorundColor() ?? .gray
  }
  
  func badgeSelectedBackgorundColor() -> UIColor {
    return uiDelegate?.badgeSelectedBackgorundColor() ?? .groupTableViewBackground
  }
  
  func locale() -> Locale {
    return dataSource?.locale() ?? .current
  }
  
  func badges() -> [Date] {
    return dataSource?.badges() ?? []
  }

  func weekdayNameDisplayType() -> AYNameDisplayType {
    return dataSource?.weekdayNameDisplayType() ?? .veryShort
  }
  
  func didSelect(date: Date?) {
    delegate?.didSelect(date: date, on: self)
  }
  
  func calendarDidPresent(with date: Date?) {
    delegate?.didPresent(calendar: self, with: date)
    monthNavigationView?.lblText.text = date?.pretty(locale: dataSource?.locale())
  }
}



