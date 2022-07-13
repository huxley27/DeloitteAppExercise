//
//  AppDelegate+RootViewController.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import NSObject_Rx
import RxSwift
import UIKit

/// Extension for RootViewController Management
///
/// Notes:
/// - This fits perfectly with the Coordinator Pattern as the AppCoordinator type.
///
extension AppDelegate {
  
  func updateRootViewController() {
      switchToDashboard()
  }

  func switchToDashboard() {
    window?.rootViewController = R.storyboard.dashboard.instantiateInitialViewController()
  }
}
