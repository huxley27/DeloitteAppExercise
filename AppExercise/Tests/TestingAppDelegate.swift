//
//  TestingAppDelegate.swift
//  Tests
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation
import UIKit

@testable import AppExercise

@objc(TestingAppDelegate)
class TestingAppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
    [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    print("<< Launching with testing app delegate")

    App.shared.bootstrap(with: application, launchOptions: launchOptions)

    return true
  }
}
