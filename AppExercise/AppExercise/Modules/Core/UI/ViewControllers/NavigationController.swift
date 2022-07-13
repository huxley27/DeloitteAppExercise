//
//  NavigationController.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2019 Huxley. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    if let controller = visibleViewController {
      return controller.supportedInterfaceOrientations
    }
    return super.supportedInterfaceOrientations
  }

  override var shouldAutorotate: Bool {
    if let controller = visibleViewController {
      return controller.shouldAutorotate
    }
    return super.shouldAutorotate
  }

  override var preferredStatusBarStyle: UIStatusBarStyle {
    if let controller = visibleViewController {
      return controller.preferredStatusBarStyle
    }
    return super.preferredStatusBarStyle
  }
}
