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
//  NKGridViewable.swift
//  NKGridTemplate
//
//  Created by Nick Kopilovskii on 7/5/19.
//

import UIKit
import NKAnyViewModel

//MARK: - NKGridViewable protocol
public protocol NKGridViewable: class {
  
  var gridConfigurator: NKGridConfigurator? { get }
  var contentCollectionView: UICollectionView? { get }
  
  func configurateCollectionView()
  
  func beginRefresh()
  func endRefresh()
  
  func reloadCollectionView()
  func reloadSections(_ sections: [Int])
  func insertSections(_ sections: [Int])
  func deleteSections(_ sections: [Int])
  
  func reloadItems(at indexPaths: [IndexPath])
  func insertItems(at indexPaths: [IndexPath])
  func deleteItems(at indexPaths: [IndexPath])
}
//MARK: -

//MARK: - NKGridViewable base implementation
public extension NKGridViewable {
  
  func configurateCollectionView() {
    guard let gridConfigurator = gridConfigurator else { return }
    contentCollectionView?.register(nibModels: gridConfigurator.cellViewModelTypes)
    contentCollectionView?.registerHeaderView(nibModels: gridConfigurator.headerViewModelTypes ?? [])
    contentCollectionView?.registerFooterView(nibModels: gridConfigurator.footerViewModelTypes ?? [])
  }
  
  func beginRefresh() {
    let offsetPoint = CGPoint.init(x: 0, y: -(contentCollectionView?.refreshControl?.frame.size.height ?? 0))
    contentCollectionView?.setContentOffset(offsetPoint, animated: true)
    contentCollectionView?.refreshControl?.beginRefreshing()
  }
  
  func endRefresh() {
    updateCollectionView { self.contentCollectionView?.refreshControl?.endRefreshing() }
  }
  
  func reloadCollectionView() {
   updateCollectionView { self.contentCollectionView?.reloadData() }
  }
  
  func reloadSections(_ sections: [Int]) {
    updateCollectionView { self.contentCollectionView?.reloadSections(IndexSet(sections)) }
  }
  
  func insertSections(_ sections: [Int]) {
    updateCollectionView { self.contentCollectionView?.insertSections(IndexSet(sections)) }
  }
  
  func deleteSections(_ sections: [Int]) {
    updateCollectionView { self.contentCollectionView?.deleteSections(IndexSet(sections)) }
  }
  
  func reloadItems(at indexPaths: [IndexPath]) {
    updateCollectionView { self.contentCollectionView?.reloadItems(at: indexPaths) }
  }
  
  func insertItems(at indexPaths: [IndexPath]) {
    updateCollectionView { self.contentCollectionView?.insertItems(at: indexPaths) }
  }
  
  func deleteItems(at indexPaths: [IndexPath]) {
    updateCollectionView { self.contentCollectionView?.deleteItems(at: indexPaths) }
  }
  
  
  fileprivate typealias UpdateAction = () -> ()
  
  fileprivate func updateCollectionView(_ action: UpdateAction? = nil) {
    DispatchQueue.main.async {
      self.contentCollectionView?.performBatchUpdates({
        action?()
      }, completion: { _ in  })
    }
  }
  
}
//MARK: -




