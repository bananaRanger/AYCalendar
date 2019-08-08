//
//
//Copyright (c) 2019 nkopilovskii <nkopilovskii@gmail.com>
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
//  UICollectionView.swift
//  NKAnyViewModel
//
//  Created by Nick Kopilovskii on 7/5/19.
//

import UIKit
import NKAnyViewModel

//MARK: - UITableView. NKAnyViewModel
public extension UICollectionView {
  
  func dequeueReusableCell(with model: NKAnyViewModel, for indexPath: IndexPath) -> UICollectionViewCell {
    let identifier = String(describing: type(of: model).viewAnyType)
    let cell = dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
    model.setupAny(view: cell)
    return cell
  }
  
  func register(nibModels: [NKAnyViewModel.Type]) {
    nibModels.forEach {
      let identifier = String(describing: $0.viewAnyType)
      let nib = UINib(nibName: identifier, bundle: nil)
      register(nib, forCellWithReuseIdentifier: identifier)
    }
  }
  
  func dequeueReusableHeaderView(with model: NKAnyViewModel, for indexPath: IndexPath) -> UICollectionReusableView {
    let identifier = String(describing: type(of: model).viewAnyType)
    let header = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: identifier, for: indexPath)
    model.setupAny(view: header)
    return header
  }
  
  func dequeueReusableFooterView(with model: NKAnyViewModel, for indexPath: IndexPath) -> UICollectionReusableView {
    let identifier = String(describing: type(of: model).viewAnyType)
    let header = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: identifier, for: indexPath)
    model.setupAny(view: header)
    return header
  }
  
  func registerHeaderView(nibModels: [NKAnyViewModel.Type]) {
    nibModels.forEach {
      let identifier = String(describing: $0.viewAnyType)
      let nib = UINib(nibName: identifier, bundle: nil)
      register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: identifier)
    }
  }
  
  func registerFooterView(nibModels: [NKAnyViewModel.Type]) {
    nibModels.forEach {
      let identifier = String(describing: $0.viewAnyType)
      let nib = UINib(nibName: identifier, bundle: nil)
      register(nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: identifier)
    }
  }
  
}
//MARK: -

//MARK: - UICollectionView Refresh Control
public extension UICollectionView {
  
  func addRefresh(target: Any?, action: Selector, text: String? = nil) {
    guard refreshControl == nil else { return }
    let control = UIRefreshControl()
    control.addTarget(target, action: action, for: .valueChanged)
    control.layer.zPosition = -1
    
    if let text = text {
      control.attributedTitle = NSAttributedString(string: text)
    }
    
    refreshControl = control
  }
  
  func deleteRefresh() {
    refreshControl?.removeFromSuperview()
    refreshControl = nil
  }
  
}
//MARK: -
