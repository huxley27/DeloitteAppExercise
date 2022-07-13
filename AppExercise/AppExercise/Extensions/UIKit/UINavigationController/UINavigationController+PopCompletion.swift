//
//  UINavigationController+PopCompletion.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2021 Huxley. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
  func pushViewController(
    _ viewController: UIViewController,
    animated: Bool,
    completion: VoidResult? = nil
  ) {
    pushViewController(viewController, animated: animated)

    guard animated else {
      completion?()
      return
    }

    if let coordinator = transitionCoordinator {
      coordinator.animate(alongsideTransition: nil) { _ in
        completion?()
      }
    } else {
      completion?()
    }
  }

  func popViewController(
    animated: Bool,
    completion: VoidResult? = nil
  ) {
    popViewController(animated: animated)

    guard animated else {
      completion?()
      return
    }

    if let coordinator = transitionCoordinator {
      coordinator.animate(alongsideTransition: nil) { _ in
        completion?()
      }
    } else {
      completion?()
    }
  }

  func popToRootViewController(
    animated: Bool,
    completion: VoidResult? = nil
  ) {
    popToRootViewController(animated: animated)

    guard animated else {
      completion?()
      return
    }

    if let coordinator = transitionCoordinator {
      coordinator.animate(alongsideTransition: nil) { _ in
        completion?()
      }
    } else {
      completion?()
    }
  }
}
