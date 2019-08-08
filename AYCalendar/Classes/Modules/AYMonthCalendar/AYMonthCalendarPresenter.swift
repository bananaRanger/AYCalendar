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
import NKAnyViewModel
import NKGridTemplate

//MARK: AYMonthCalendarPresenter class
class AYMonthCalendarPresenter: NKGridConfigurator {
  
  //MARK: - enums
  private enum Section: Int, CaseIterable {
    case weekdays = 0
    case days
  }
  
  //MARK: - properties
  private let rowsCount = 6
  private let columnCount = 7
  
  lazy var weeks = {
    return AYDateManager.weekdayNames(
      with: delegate?.weekdayNameDisplayType(),
      locale: delegate?.locale())
  }()
  
  var dates: [Date] {
    return AYDateManager.datesForMonth(
      in: date,
      includesPastAndPrevMonthsDays: true)
  }
  
  weak var viewer: NKGridViewable?
  
  var selectedDate: Date?
  var date: Date?
  
  weak var delegate: AYMonthCalendarDelegate?
  
  var isRefreshable: Bool = false
  var refreshTitle: String? { return nil }
  
  var cellViewModelTypes: [NKAnyViewModel.Type] {
    return [AYCalendarTitleViewModel.self, AYCalendarItemViewModel.self]
  }
  
  var headerViewModelTypes: [NKAnyViewModel.Type]? { return nil }
  var footerViewModelTypes: [NKAnyViewModel.Type]? { return nil }
  
  var numberOfSections: Int {
    return Section.allCases.count
  }
  
  //MARK: - inits
  init(_ viewer: NKGridViewable) {
    self.viewer = viewer
  }
  
  //MARK: - methods
  func select(with date: Date?) {
    guard let date = date,
      let index = dates.firstIndex(where: { date.isSpecificDay($0) }) else { return }
    let indexPath = IndexPath(row: index, section: Section.days.rawValue)
    viewer?.contentCollectionView?.selectItem(at: indexPath, animated: true, scrollPosition: [])
  }
  
  func deselect() {
    guard let date = selectedDate,
      let index = dates.firstIndex(where: { date.isSpecificDay($0) }) else { return }
    let indexPath = IndexPath(row: index, section: Section.days.rawValue)
    viewer?.contentCollectionView?.deselectItem(at: indexPath, animated: true)
    selectedDate = nil
  }
  
  func shouldSelectItemAt(indexPath: IndexPath) -> Bool {
    guard Section.days.rawValue == indexPath.section,
      !dates[indexPath.row].isSpecificDay(selectedDate),
      dates[indexPath.row].isSpecificMonth(date) else { return false }
    return true
  }
  
  func numberOfItems(in section: Int) -> Int {
    return section == Section.weekdays.rawValue ?
      columnCount : dates.count
  }
  
  func cellViewModel(for indexPath: IndexPath) -> NKAnyViewModel? {
    if indexPath.section == Section.weekdays.rawValue {
      let model = AYCalendarTitleViewModel(text: weeks[indexPath.row])
      model.font = delegate?.weekFont()
      model.textColor = delegate?.weekTextColor()
      return model
    } else if indexPath.section == Section.days.rawValue {
      let model = AYCalendarItemViewModel(date: dates[indexPath.row])
      model.currentDate = date
      model.selectedDate = selectedDate
      
      model.font = delegate?.dayFont()
      model.pastDaysColor = delegate?.pastDaysColor()
      model.notCurrentMonthDaysColor = delegate?.notCurrentMonthDaysColor()
      model.currentMonthDaysColor = delegate?.currentMonthDaysColor()
      model.selectedDayTextColor = delegate?.selectedDayTextColor()
      model.selectedDayBackgorundColor = delegate?.selectedDayBackgorundColor()
      model.badgeHeight = delegate?.badgeHeight()
      model.badgeBackgorundColor = delegate?.badgeBackgorundColor()
      model.badgeSelectedBackgorundColor = delegate?.badgeSelectedBackgorundColor()
      model.isBadged = delegate?.badges().contains(where: { $0.isSpecificDay(model.date) })
      return model
    }
    return nil
  }
  
  func headerViewModel(for section: Int) -> NKAnyViewModel? { return nil }
  func footerViewModel(for section: Int) -> NKAnyViewModel? { return nil }
  func didSelectItem(at indexPath: IndexPath) { }
  func didMakeRefresh() { }
  
  func cellSize(for indexPath: IndexPath) -> CGSize {
    guard let collectionView = viewer?.contentCollectionView else { return .zero }
    
    let layout = collectionView.collectionViewLayout
    guard let flowLayout = layout as? UICollectionViewFlowLayout else { return .zero }
    
    let inset = flowLayout.sectionInset
    let itemsSpacing = flowLayout.minimumLineSpacing
    
    let cellCount = CGFloat(columnCount)
    let spaceCount = CGFloat(columnCount + 1)
    
    let spaceWidth = inset.left + inset.right + itemsSpacing * spaceCount
    let allowedWith = collectionView.bounds.width - spaceWidth
    
    return CGSize(width: allowedWith / cellCount, height: allowedWith / cellCount)
  }
}
