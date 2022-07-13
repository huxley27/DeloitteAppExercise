//
//  UIViewController+Child.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
  func addAsChild(to parent: UIViewController) {
    parent.addChild(self)
    parent.view.addSubview(view)
    didMove(toParent: parent)
  }

  /// Add a child view controller
  /// - Parameters:
  ///   - viewController: The viewController to add
  ///   - view: The container view
  func add(asChild viewController: UIViewController, toView view: UIView? = nil) {
    guard let containerView = (view ?? self.view) else {
      preconditionFailure("`self.view` should not be nil at this point")
    }

    addChild(viewController)
    containerView.addSubview(viewController.view)

    viewController.view.frame = containerView.bounds
    viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    viewController.didMove(toParent: self)
  }

  func removeAsChild() {
    // Just to be safe, we check that this view controller
    // is actually added to a parent before removing it.
    guard parent != nil else {
      return
    }

    willMove(toParent: nil)
    view.removeFromSuperview()
    removeFromParent()
  }
}
