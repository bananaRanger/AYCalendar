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
import NKGridTemplate

typealias AYMonthCalendarSelectedHandler = ((AYMonthCalendarViewController, Date) -> (Void))

//MARK: AYMonthCalendarDelegate class
protocol AYMonthCalendarDelegate: class {
  func monthContentInsets() -> UIEdgeInsets
  func monthVerticalSpacing() -> CGFloat
  func monthHorizontalSpacing() -> CGFloat
  
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
  
  func locale() -> Locale
  func badges() -> [Date]
  func weekdayNameDisplayType() -> AYNameDisplayType
  
  func calendarDidPresent(with date: Date?)
  func didSelect(date: Date?)
}

//MARK: - AYMonthCalendarViewController class
class AYMonthCalendarViewController: NKGridViewController {
  
  //MARK: - properties
  var onDidSelectHandler: AYMonthCalendarSelectedHandler?
  var selectedDate: Date?
  var date: Date?
  
  weak var delegate: AYMonthCalendarDelegate?
  
  override var gridConfigurator: NKGridConfigurator? { return presenter }
  override var contentCollectionView: UICollectionView? { return collectionView }
  
  private var collectionView: UICollectionView?

  private lazy var presenter: AYMonthCalendarPresenter = {
    let presenter = AYMonthCalendarPresenter(self)
    presenter.selectedDate = selectedDate
    presenter.delegate = delegate
    presenter.date = date
    return presenter
  }()
  
  private var layout: UICollectionViewFlowLayout {
    let layout = UICollectionViewFlowLayout()
    guard let delegate = delegate else { return layout }
    layout.sectionInset = delegate.monthContentInsets()
    layout.minimumLineSpacing = delegate.monthVerticalSpacing()
    layout.minimumInteritemSpacing = delegate.monthHorizontalSpacing()
    return layout
  }
  
  //MARK: - methods
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView = UICollectionView(
      frame: view.bounds,
      collectionViewLayout: layout)
    
    collectionView?.register(
      AYCalendarTitleCell.self,
      forCellWithReuseIdentifier: AYCalendarTitleCell.className)
    
    collectionView?.register(
      AYCalendarItemCell.self,
      forCellWithReuseIdentifier: AYCalendarItemCell.className)
    
    collectionView?.showsVerticalScrollIndicator = false
    collectionView?.backgroundColor = .clear
    
    collectionView?.delegate = self
    collectionView?.dataSource = self
    
    guard let collectionView = collectionView else { return }
    
    view.addSubview(collectionView)
    view.addAllSidesAnchors(to: collectionView)
    
    presenter.select(with: selectedDate)
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    collectionView?.collectionViewLayout.invalidateLayout()
  }
  
  override func collectionView(
    _ collectionView: UICollectionView,
    didSelectItemAt indexPath: IndexPath) {
    let date = presenter.dates[indexPath.row]
    onDidSelectHandler?(self, date)
    presenter.selectedDate = date
    selectedDate = date
    delegate?.didSelect(date: date)
  }
  
  func select() {
    presenter.select(with: selectedDate)
  }
  
  func deselect() {
    presenter.deselect()
  }
}

//MARK: - AYMonthCalendarViewController extension
extension AYMonthCalendarViewController {
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath) -> CGSize {
    return presenter.cellSize(for: indexPath)
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    shouldSelectItemAt indexPath: IndexPath) -> Bool {
    return presenter.shouldSelectItemAt(indexPath: indexPath)
  }
}
