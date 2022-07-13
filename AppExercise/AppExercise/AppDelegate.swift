//
//  AppDelegate.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2018 Huxley. All rights reserved.
//

import AlamofireNetworkActivityIndicator
import AlamofireNetworkActivityLogger
import FBSDKCoreKit
import GoogleSignIn
// import Firebase
import IQKeyboardManagerSwift
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  override init() {}

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
  ) -> Bool {
    // Make sure you have the corresponding `GoogleService-Info.plist` files before
    // uncommenting the next line. Should include both the production and the staging files.
    // FirebaseApp.configure()

    App.shared.bootstrap(with: application, launchOptions: launchOptions)

    #if DEBUG
      NetworkActivityLogger.shared.level = .debug
      NetworkActivityLogger.shared.startLogging()
    #endif

    IQKeyboardManager.shared.enable = true
    NetworkActivityIndicatorManager.shared.isEnabled = true

    GIDSignIn.sharedInstance().clientID = AppUser.googleClientID

    // Facebook application delegate
    // Update first info.plist for keys `FacebookAppID`, `FacebookDisplayName` and `LSApplicationQueriesSchemes`
    // Check facebook documentation for updated keys: https://developers.facebook.com/docs/facebook-login/ios
    ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)

    window = UIWindow(frame: UIScreen.main.bounds)
    window?.backgroundColor = UIColor.black
    window?.tintColor = Styles.Colors.windowTint
    updateRootViewController()
    loadAppearancePreferences()
    window?.makeKeyAndVisible()

    setupAppUserNotificationObservers()

    if let userInfo = launchOptions?[UIApplication.LaunchOptionsKey.remoteNotification] as? [AnyHashable: Any] {
      App.shared.remoteNotificationManager.storeNotification(userInfo)
    }

    return true
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    if App.shared.user.isLoggedIn {
      // App.shared.remoteNotificationManager.requestPermissionToShowPushNotifications()
      // App.shared.sendFCMTokenToServerIfNeeded()
      // App.shared.remoteNotificationManager.processStoredNotification()
    }

    // TODO: Manage this properly.
    application.applicationIconBadgeNumber = 0
  }

  func applicationDidEnterBackground(_ application: UIApplication) {}

  func applicationWillResignActive(_ application: UIApplication) {}

  func applicationWillEnterForeground(_ application: UIApplication) {}

  func applicationWillTerminate(_ application: UIApplication) {}
}

// MARK: - RootViewController Management

extension AppDelegate {
  func updateRootViewController() {
    if App.shared.user.isLoggedIn {
      switchToDashboard()
    } else {
      switchToFrontPage()
    }
  }

  func switchToDashboard() {
    window?.setRootViewControllerAnimated(R.storyboard.main.instantiateInitialViewController())
  }

  func switchToFrontPage() {
    let nav = R.storyboard.temp1.navigationController()
    if let controller = nav?.viewControllers.first as? EmailCheckerController {
      controller.viewModel = EmailCheckerViewModel()
    }
    window?.setRootViewControllerAnimated(nav)
    // self.window?.setRootViewControllerAnimated(R.storyboard.auth.instantiateInitialViewController())
  }

  func setupAppUserNotificationObservers() {
    let nc = NotificationCenter.default
    let opQueue = OperationQueue.main

    _ = nc.addObserver(
      forName: AppUser.Notifications.didLogin,
      object: App.shared.user,
      queue: opQueue,
      using: { [weak self] _ in
        self?.updateRootViewController()
      }
    )
    _ = nc.addObserver(
      forName: AppUser.Notifications.didLogout,
      object: App.shared.user,
      queue: opQueue,
      using: { [weak self] _ in
        self?.updateRootViewController()
      }
    )
  }
}

// MARK: - User Notifications

extension AppDelegate {
  /// Receives the device token needed to deliver remote notifications. Device tokens can change,
  /// so your app needs to re-register every time it is launched and pass the received token back
  /// to your server. Device tokens always change when the user restores backup data to a new
  /// device or computer or re-installs the operating system.
  func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
    let token = tokenParts.joined()
    debugLog("Device Token: \(token)")
    guard App.shared.user.isLoggedIn else { return }
    // App.shared.apnToken = token
    // App.shared.sendFCMTokenToServerIfNeeded()
  }

  func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
    // you should process the error object appropriately and disable any features related to
    // remote notifications. Because notifications are not going to be arriving anyway, it is
    // usually better to degrade gracefully and avoid any unnecessary work needed to process
    // or display those notifications.
    debugLog("Failed to register: \(error)")
    App.shared.recordError(error)
  }

  func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
    debugLog(String(describing: userInfo))
    // App.shared.remoteNotificationManager.storeNotification(userInfo)
  }
}

// MARK: - Login with Facebook/Google

extension AppDelegate {
  func application(
    _ app: UIApplication,
    open url: URL,
    options: [UIApplication.OpenURLOptionsKey: Any] = [:]
  )
    -> Bool {
    // handle Facebook url scheme
    guard ApplicationDelegate.shared.application(app, open: url, options: options) else {
      // handle Google url scheme
      return GIDSignIn.sharedInstance().handle(url)
    }
    return true
  }
}
