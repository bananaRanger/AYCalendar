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

//MARK: AYCalendarItemCell cell class
class AYCalendarItemCell: UICollectionViewCell {
  
  //MARK: - properties
  var previousTextColor: UIColor?
  var selectedTextColor: UIColor?
  var selectedBackgorundColor: UIColor?
  var font: UIFont?
  
  var badgeHeight: CGFloat?
  var badgeBackgorundColor: UIColor?
  var badgeSelectedBackgorundColor: UIColor?
  
  var isBadged: Bool? {
    didSet {
      if isBadged == true {
        addBadge(textSize: font?.pointSize ?? 0)
      } else {
        removeBadge()
      }
    }
  }
  
  override var isSelected: Bool {
    didSet {
      if isSelected {
        if label?.textColor != selectedTextColor {
          previousTextColor = label?.textColor
        }
        label?.textColor = selectedTextColor
        layer.cornerRadius = bounds.height / 2
        backgroundColor = selectedBackgorundColor
        badge?.backgroundColor = badgeSelectedBackgorundColor
      } else {
        label?.textColor = previousTextColor
        layer.cornerRadius = 0
        backgroundColor = .clear
        badge?.backgroundColor = badgeBackgorundColor
      }
    }
  }
  
  //MARK: - ui components
  weak var label: UILabel?
  weak var badge: UIView?

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
    badge?.layoutSubviews()
    if isSelected {
      label?.textColor = selectedTextColor
      layer.cornerRadius = bounds.height / 2
      backgroundColor = selectedBackgorundColor
      badge?.backgroundColor = badgeSelectedBackgorundColor
    } else {
      label?.textColor = previousTextColor
      layer.cornerRadius = 0
      backgroundColor = .clear
      badge?.backgroundColor = badgeBackgorundColor
    }
  }

}

//MARK: - AYCalendarItemCell fileprivate extension
fileprivate extension AYCalendarItemCell {
  func setup() {
    let label = UILabel()
    label.textAlignment = .center
    addSubview(label)
    addAllSidesAnchors(to: label)
    self.label = label
  }
  
  func addBadge(textSize: CGFloat) {
    let side: CGFloat = badgeHeight ?? 0
    let space = (textSize / 2) + (side / 2)
    
    let badge = UIView()
    badge.backgroundColor = badgeBackgorundColor
    badge.layer.cornerRadius = side / 2
    addSubview(badge)
    
    addBadgeAnchors(
      for: badge,
      with: side,
      space: space)
    
    self.badge = badge
  }
  
  func removeBadge() {
    badge?.removeFromSuperview()
    badge = nil
  }
}

//MARK: - UIView fileprivate extension
fileprivate extension UIView {
  func addBadgeAnchors(for view: UIView, with side: CGFloat, space: CGFloat) {
    view.translatesAutoresizingMaskIntoConstraints = false
    view.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -space).isActive = true
    view.centerXAnchor.constraint(equalTo: centerXAnchor, constant: space).isActive = true
    view.heightAnchor.constraint(equalToConstant: side).isActive = true
    view.widthAnchor.constraint(equalToConstant: side).isActive = true
  }
}



//MARK: - AYCalendarItemViewModel view model class for AYCalendarItemCell cell
class AYCalendarItemViewModel: NKViewModel {
  
  //MARK: - properies
  private var text: String?

  var date: Date
  var currentDate: Date?
  var selectedDate: Date?

  var font: UIFont?
  var pastDaysColor: UIColor?
  var notCurrentMonthDaysColor: UIColor?
  var currentMonthDaysColor: UIColor?
  var selectedDayTextColor: UIColor?
  var selectedDayBackgorundColor: UIColor?
  
  var badgeHeight: CGFloat?
  var badgeBackgorundColor: UIColor?
  var badgeSelectedBackgorundColor: UIColor?
  
  var isBadged: Bool?
  
  init(date: Date) {
    self.date = date
  }
  
  //MARK: - methods
  func setup(view: AYCalendarItemCell) {
    view.font = font
  
    view.label?.font = font
    view.label?.textColor = currentMonthDaysColor
    
    if date.isDateInPast {
      view.label?.textColor = pastDaysColor
    }
    
    if !date.isSpecificMonth(currentDate) {
      view.label?.textColor = notCurrentMonthDaysColor
      view.isUserInteractionEnabled = false
    } else {
      view.isUserInteractionEnabled = true
    }
    
    view.previousTextColor = view.label?.textColor
    
    view.selectedTextColor = selectedDayTextColor
    view.selectedBackgorundColor = selectedDayBackgorundColor
    
    view.badgeHeight = badgeHeight
    view.badgeBackgorundColor = badgeBackgorundColor
    view.badgeSelectedBackgorundColor = badgeSelectedBackgorundColor
    
    view.isBadged = isBadged

    view.label?.text = String(date.day)
  }
}
