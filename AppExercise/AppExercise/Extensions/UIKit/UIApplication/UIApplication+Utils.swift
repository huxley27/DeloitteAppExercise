//
//  UIApplication+Utils.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2018 Huxley. All rights reserved.
//

import UIKit

extension UIApplication {
  var firstKeyWindow: UIWindow? { windows.first { $0.isKeyWindow } }
  
  static var bundleIdentifier: String? {
    return Bundle.main.bundleIdentifier
  }

  static var isRunningTests: Bool {
    return ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
  }
}
