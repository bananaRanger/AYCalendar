//
//
//Copyright (c) 2019 Nick Kopilovskii <nkopilovskii@gmail.com>
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in
//all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//THE SOFTWARE.
//
//  NKGridViewConfigurator.swift
//  NKGridTemplate
//
//  Created by Nick Kopilovskii on 7/5/19.
//

import Foundation
import NKAnyViewModel

//MARK: - NKListConfigurator
public protocol NKGridConfigurator {
  
  var viewer: NKGridViewable? { get }
  
  var isRefreshable: Bool { get }
  var refreshTitle: String? { get }
  
  var cellViewModelTypes: [NKAnyViewModel.Type] { get }
  var headerViewModelTypes: [NKAnyViewModel.Type]? { get }
  var footerViewModelTypes: [NKAnyViewModel.Type]? { get }
  
  var numberOfSections: Int { get }
  
  func numberOfItems(in section: Int) -> Int
  func cellViewModel(for indexPath: IndexPath) -> NKAnyViewModel?
  func headerViewModel(for section: Int) -> NKAnyViewModel?
  func footerViewModel(for section: Int) -> NKAnyViewModel?
  
  func didSelectItem(at indexPath: IndexPath)
  
  func didMakeRefresh()
}
