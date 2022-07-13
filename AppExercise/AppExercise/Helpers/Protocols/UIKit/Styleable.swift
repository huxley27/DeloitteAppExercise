//
//  Styleable.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import UIKit

protocol Styleable where Self: UIView {
  associatedtype StyleType: ViewStyleType
  func applyStyle(_ style: StyleType)
}

protocol ViewStyleType {
  associatedtype ViewType: UIView
  func apply(to view: ViewType)
}
