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
import NKAnyViewModel

//MARK: AYCalendarTitleCell cell class
class AYCalendarTitleCell: UICollectionViewCell {
  
  //MARK: - ui components
  weak var label: UILabel?
  
  //MARK: - properties
  var defaultTextColor: UIColor? {
    didSet {
      label?.textColor = defaultTextColor
    }
  }
  
  //MARK: - inits
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  //MARK: - methods
  override func layoutSubviews() {
    super.layoutSubviews()
    label?.textColor = defaultTextColor
  }
}

//MARK: - AYCalendarTitleCell fileprivate extension
fileprivate extension AYCalendarTitleCell {
  func setup() {
    let label = UILabel()
    label.textAlignment = .center
    addSubview(label)
    addAllSidesAnchors(to: label)
    self.label = label
  }
}



//MARK: - AYCalendarTitleViewModel view model class for AYCalendarTitleCell cell
class AYCalendarTitleViewModel: NKViewModel {

  //MARK: - properies
  private var text: String?
  
  var font: UIFont?
  var textColor: UIColor?

  init(text: String?) {
    self.text = text
  }
  
  //MARK: - methods
  func setup(view: AYCalendarTitleCell) {
    view.label?.text = text
    view.label?.font = font
    view.defaultTextColor = textColor
    view.isUserInteractionEnabled = false
  }
  
}
