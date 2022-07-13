//
//  UIViewController+Dismiss.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2019 Huxley. All rights reserved.
//

import UIKit

extension UIViewController {
  var isPresentedModally: Bool {
    return presentingViewController != nil ||
      navigationController?.presentingViewController?.presentedViewController === navigationController ||
      tabBarController?.presentingViewController is UITabBarController
  }

  var isNavigationRootVC: Bool {
    navigationController?.viewControllers.count == 1
  }
  
  var isDirectlyPresentedModal: Bool {
    navigationController == nil
  }
}

// MARK: - IBAction

private extension UIViewController {
  @IBAction
  func dismissPage() {
    dismissPage(animated: true)
  }

  @IBAction
  func dismissModal() {
    dismissModal(animated: true)
  }
}

// MARK: - Methods

extension UIViewController {
  func dismissPage(
    animated: Bool,
    completion: VoidResult? = nil
  ) {
    if isNavigationRootVC || isDirectlyPresentedModal {
      dismissModal(
        animated: animated,
        completion: completion
      )
    } else {
      navigationController?.popViewController(
        animated: animated,
        completion: completion
      )
    }
  }

  func dismissPageToRoot(
    animated: Bool,
    completion: VoidResult? = nil
  ) {
    if isNavigationRootVC || isDirectlyPresentedModal {
      dismissModalToRoot(
        animated: animated,
        completion: completion
      )
    } else {
      dismissNavigationToRoot(
        animated: animated,
        completion: completion
      )
    }
  }
}

// MARK: - Helpers

extension UIViewController {
  func dismissModal(
    animated: Bool,
    completion: VoidResult? = nil
  ) {
    dismiss(
      animated: animated,
      completion: completion
    )
  }

  func dismissModalToRoot(
    animated: Bool,
    completion: VoidResult? = nil
  ) {
    view.window?.rootViewController?.dismiss(
      animated: animated,
      completion: completion
    )
  }

  func dismissNavigationToRoot(
    animated: Bool,
    completion: VoidResult? = nil
  ) {
    navigationController?.popToRootViewController(
      animated: animated,
      completion: completion
    )
  }
}
