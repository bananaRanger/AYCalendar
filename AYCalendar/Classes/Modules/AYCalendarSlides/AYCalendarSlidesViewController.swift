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

//MARK: AYCalendarSlidesViewController class
class AYCalendarSlidesViewController: NKSlidesViewController {
  
  //MARK: - properties
  var selectedDate: Date? {
    didSet {
      presenter.selectedDate = selectedDate
    }
  }
  
  override var source: NKSlidesSource? { return presenter }
  override var container: UIView { return view }
  
  weak var presenterDelegate: AYMonthCalendarDelegate? {
    get {
      return presenter.delegate
    }
    set {
      presenter.delegate = newValue
    }
  }
  
  private lazy var presenter: AYCalendarSlidesPresenter = {
    return AYCalendarSlidesPresenter(self, selectedDate: selectedDate)
  }()
  
  //MARK: - methods
  static func calendar(date: Date?) -> AYCalendarSlidesViewController {
    let viewController = AYCalendarSlidesViewController()
    viewController.selectedDate = date ?? Date()
    return viewController
  }
  
  func goToNextPage() {
    presenter.goToNextPage()
  }
  
  func goToPrevPage() {
    presenter.goToPrevPage()
  }
}
