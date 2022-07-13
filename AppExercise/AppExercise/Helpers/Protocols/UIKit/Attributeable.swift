//
//  Attributeable.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import UIKit

protocol Attributeable where Self: UIView {
  associatedtype AttributeType: ViewAttributeType
  func applyAttribute(_ attribute: AttributeType)
}

protocol ViewAttributeType {
  associatedtype ViewType: UIView
  func apply(to view: ViewType)
}
