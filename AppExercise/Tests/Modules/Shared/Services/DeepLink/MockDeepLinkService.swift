//
//  MockDeepLinkService.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//  

import Foundation
import UIKit

@testable import AppExercise

class MockDeepLinkService: DeepLinkServiceProtocol {
  var hasDeepLinkToExecute: Bool = false
  
  var shouldPresentInForeground: Bool = false
  
  var handlePushNotificationCallCount: Int = 0
  var handlePushNotificationUserInfo: [AnyHashable: Any]?
  
  var handleShortcutCallCount: Int = 0
  var handleShortcutItem: UIApplicationShortcutItem?
  
  var handleDynamicLinkCallCount: Int = 0
  var handleDynamicLinkURL: URL?
  
  var executeDeepLinkCallCount: Int = 0
}

// MARK: - Methods

extension MockDeepLinkService {
  func shouldPresentPushNotificationInForeground(
    with userInfo: [AnyHashable: Any]
  ) -> Bool {
    return shouldPresentInForeground
  }
  
  func handlePushNotification(with userInfo: [AnyHashable: Any]) {
    handlePushNotificationCallCount += 1
    handlePushNotificationUserInfo = userInfo
  }
  
  func handleShortcut(from item: UIApplicationShortcutItem) {
    handleShortcutCallCount += 1
    handleShortcutItem = item
  }
  
  func handleDynamicLink(from url: URL) {
    handleDynamicLinkCallCount += 1
    handleDynamicLinkURL = url
  }
  
  func executeDeepLink() {
    executeDeepLinkCallCount += 1
  }
}
