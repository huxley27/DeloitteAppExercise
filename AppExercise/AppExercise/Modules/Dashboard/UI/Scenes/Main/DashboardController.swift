//
//  DashboardController.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Hero
import UIKit

class DashboardController: UITabBarController {}

// MARK: - Lifecycle

extension DashboardController {
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }
}

// MARK: - Setup

private extension DashboardController {
  func setup() {
    setupVMs()
  }

  func setupVMs() {
    setupProfileTab()
  }

  func setupProfileTab() {
//    guard let vc = initialController(for: .profile) as? AccountController else {
//      preconditionFailure("Expecting viewController of type MyProfileController")
//    }
//    vc.viewModel = AccountViewModel()
  }

  func initialController(for tab: Tab) -> UIViewController {
    guard let nc = viewControllers?[tab.index] as? UINavigationController else {
      preconditionFailure("Expecting all viewControllers to be of type UINavigationController")
    }
    guard let vc = nc.viewControllers.first else {
      preconditionFailure("Expecting navigationController to have rootViewController")
    }
    return vc
  }
}

private enum Tab: Int {
  case home = 0
  case profile

  var index: Int { rawValue }
}
