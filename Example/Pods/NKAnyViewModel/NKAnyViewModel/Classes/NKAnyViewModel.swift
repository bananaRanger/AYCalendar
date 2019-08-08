//
//  AnyViewModel.swift
//
//  Created by Nick Kopilovskii on 7/4/19.
//  Copyright © 2019 Nick Kopilovskii. All rights reserved.
//

import UIKit

//MARK: - NKAnyViewModel protocol
public protocol NKAnyViewModel {
  static var viewAnyType: UIView.Type { get }
  func setupAny(view: UIView)
}
//MARK: -

//MARK: - NKViewModel protocol
public protocol NKViewModel: NKAnyViewModel {
  associatedtype ViewType: UIView
  func setup(view: ViewType)
}
//MARK: -

//MARK: - NKViewModel extension
public extension NKViewModel {
  static var viewAnyType: UIView.Type {
    return ViewType.self
  }
  
  func setupAny(view: UIView) {
    if let view = view as? ViewType {
      setup(view: view)
    } else {
      //TODO: Handle this
      assertionFailure("Error: \(#function) \(#file) \(#line)")
    }
  }
}
//MARK: -
