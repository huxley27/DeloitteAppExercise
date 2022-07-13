//
//  AppDelegate.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2018 Huxley. All rights reserved.
//

import AlamofireNetworkActivityIndicator
import AlamofireNetworkActivityLogger
import IQKeyboardManagerSwift
import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
  // swiftlint:disable:next force_cast
  static var shared: AppDelegate { UIApplication.shared.delegate as! AppDelegate }
  
  var window: UIWindow?

  override init() {}

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
  ) -> Bool {
    
    App.shared.bootstrap(with: application, launchOptions: launchOptions)
    
    #if DEBUG
      NetworkActivityLogger.shared.level = .debug
      NetworkActivityLogger.shared.startLogging()
    #endif

    IQKeyboardManager.shared.enable = true

    NetworkActivityIndicatorManager.shared.isEnabled = true

    window = UIWindow(frame: UIScreen.main.bounds)
    window?.backgroundColor = T.component.window.backgroundColor
    window?.tintColor = T.component.window.tintColor
    updateRootViewController()
    loadAppearancePreferences()
    window?.makeKeyAndVisible()

    func switchToDashboard() {
      window?.rootViewController = R.storyboard.dashboard.instantiateInitialViewController()
    }
    
    return true
  }

  func applicationDidBecomeActive(_ application: UIApplication) {}

  func applicationDidEnterBackground(_ application: UIApplication) {}

  func applicationWillResignActive(_ application: UIApplication) {}

  func applicationWillEnterForeground(_ application: UIApplication) {}

  func applicationWillTerminate(_ application: UIApplication) {}
}
