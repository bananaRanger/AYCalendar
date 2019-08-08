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

extension UIView {
  public func addAllSidesAnchors(to view: UIView, constant: CGFloat = 0) {
    view.translatesAutoresizingMaskIntoConstraints = false
    view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -constant).isActive = true
    if #available(iOS 11.0, *) {
      view.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -constant).isActive = true
      view.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: constant).isActive = true
      view.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: constant).isActive = true
    } else {
      view.rightAnchor.constraint(equalTo: rightAnchor, constant: -constant).isActive = true
      view.leftAnchor.constraint(equalTo: leftAnchor, constant: constant).isActive = true
      view.topAnchor.constraint(equalTo: topAnchor, constant: constant).isActive = true
    }
  }
  
  public func addAnchorsWithFixedHeight(_ height: CGFloat, to view: UIView, with constant: CGFloat = 0) {
    view.translatesAutoresizingMaskIntoConstraints = false
    view.heightAnchor.constraint(equalToConstant: height).isActive = true
    if #available(iOS 11.0, *) {
      view.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: constant).isActive = true
      view.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: constant).isActive = true
      view.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -constant).isActive = true
    } else {
      view.topAnchor.constraint(equalTo: topAnchor, constant: constant).isActive = true
      view.leftAnchor.constraint(equalTo: leftAnchor, constant: constant).isActive = true
      view.rightAnchor.constraint(equalTo: rightAnchor, constant: -constant).isActive = true
    }
  }
  
  public func addAnchorsForRelatedTopView(_ topView: UIView, for view: UIView, with constant: CGFloat = 0) {
    view.translatesAutoresizingMaskIntoConstraints = false
    view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -constant).isActive = true
    view.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: constant).isActive = true
    if #available(iOS 11.0, *) {
      view.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -constant).isActive = true
      view.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: constant).isActive = true
    } else {
      view.rightAnchor.constraint(equalTo: rightAnchor, constant: -constant).isActive = true
      view.leftAnchor.constraint(equalTo: leftAnchor, constant: constant).isActive = true
    }
  }
  
  public func addFixedHeight(_ value: CGFloat) {
    translatesAutoresizingMaskIntoConstraints = false
    heightAnchor.constraint(equalToConstant: value).isActive = true
  }
}
