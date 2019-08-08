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
import NKSlideScreensTemplate

//MARK:  AYCalendarSlidesPresenter class
class AYCalendarSlidesPresenter: NKSlidesSource {
  
  //MARK: - properties
  var viewer: NKSlideScreenViewable?
  var selectedDate: Date?
  
  private var currentDate: Date?
  
  weak var delegate: AYMonthCalendarDelegate?
  
  var initialPage: UIViewController {
    let initial = monthCalendarViewController(with: currentDate)
    selectedMonthViewController = initial
    didPresent(initial)
    return initial
  }
  
  private var selectedMonthViewController: AYMonthCalendarViewController?
  
  private var didPresentHandler: (() -> Void) {
    return { [weak self] in
      self?.delegate?.calendarDidPresent(with: self?.currentDate)
    }
  }
  
  //MARK: - inits
  init(_ viewer: NKSlideScreenViewable, selectedDate: Date? = nil) {
    self.viewer = viewer
    self.selectedDate = selectedDate ?? Date()
    self.currentDate = selectedDate
  }
  
  //MARK: - methods
  func goToNextPage() {
    currentDate = currentDate?.nextMonth
    viewer?.contentPageViewController.setViewControllers(
      [monthCalendarViewController(with: currentDate)],
      direction: .forward,
      animated: true) { [weak self] _ in self?.didPresentHandler() }
  }
  
  func goToPrevPage() {
    currentDate = currentDate?.prevMonth
    viewer?.contentPageViewController.setViewControllers(
      [monthCalendarViewController(with: currentDate)],
      direction: .reverse,
      animated: true) { [weak self] _ in self?.didPresentHandler() }
  }
  
  func didPresent(_ page: UIViewController?) {
    guard let viewController = page as? AYMonthCalendarViewController else { return }
    currentDate = viewController.date
    didPresentHandler()
  }
  
  func page(after viewController: UIViewController) -> UIViewController? {
    return monthCalendarViewController(with: currentDate?.nextMonth)
  }
  
  func page(before viewController: UIViewController) -> UIViewController? {
    return monthCalendarViewController(with: currentDate?.prevMonth)
  }
  
  private func monthCalendarViewController(with date: Date?) -> AYMonthCalendarViewController {
    let viewController = AYMonthCalendarViewController()
    viewController.onDidSelectHandler = onDidSelectHandler()
    viewController.delegate = delegate
    viewController.selectedDate = selectedDate
    viewController.date = date
    return viewController
  }
  
  private func onDidSelectHandler() -> AYMonthCalendarSelectedHandler {
    return { [weak self] vc, date in
      self?.selectedMonthViewController?.deselect()
      self?.selectedMonthViewController = vc
      self?.selectedDate = date
    }
  }
}
