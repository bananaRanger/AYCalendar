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
//  NKListViewController.swift
//  NKGridTemplate
//
//  Created by Nick Kopilovskii on 7/5/19.
//

import UIKit
import NKAnyViewModel

//MARK: - NKListViewController class
open class NKGridViewController: UIViewController,  NKGridViewable, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
  open var gridConfigurator: NKGridConfigurator? { return nil }
  open var contentCollectionView: UICollectionView? { return nil }
  
  
  open override func viewDidLoad() {
    super.viewDidLoad()
    configurateCollectionView()
    
    if let isRefreshable = gridConfigurator?.isRefreshable, isRefreshable {
      contentCollectionView?.addRefresh(target: self, action: #selector(refresh))
    } else {
      contentCollectionView?.deleteRefresh()
    }
  }
  
  open func numberOfSections(in collectionView: UICollectionView) -> Int {
    return gridConfigurator?.numberOfSections ?? 0
  }
  
  open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return gridConfigurator?.numberOfItems(in: section) ?? 0
  }
  
  open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let viewModel = gridConfigurator?.cellViewModel(for: indexPath) else {
      return UICollectionViewCell()
    }
    return collectionView.dequeueReusableCell(with: viewModel, for: indexPath)
  }
  
  open func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    if kind == UICollectionView.elementKindSectionHeader {
      guard let viewModel = gridConfigurator?.headerViewModel(for: indexPath.section) else { return UICollectionReusableView() }
      return collectionView.dequeueReusableHeaderView(with: viewModel, for: indexPath)
    } else if kind == UICollectionView.elementKindSectionFooter {
      guard let viewModel = gridConfigurator?.footerViewModel(for: indexPath.section) else { return UICollectionReusableView() }
      return collectionView.dequeueReusableFooterView(with: viewModel, for: indexPath)
    }
    
    return UICollectionReusableView()
  }
  
  open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    gridConfigurator?.didSelectItem(at: indexPath)
  }
  @objc open func refresh() {
    gridConfigurator?.didMakeRefresh()
  }
}
//MARK: -

