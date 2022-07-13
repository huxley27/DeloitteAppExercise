//
//  Notifications.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

// MARK: - Session

extension Notification.Name {
  private static var prefix: String { "com.AppExercise.notification.name.session" }

  static let didLogin = Notification.Name(rawValue: "\(prefix).didLogin")
  static let didLogout = Notification.Name(rawValue: "\(prefix).didLogout")
  static let didSkipEmailVerification = Notification.Name(rawValue: "\(prefix).didSkipEmailVerification")
  static let didCompleteOTPOnboarding = Notification.Name(rawValue: "\(prefix).didCompleteOTPOnboarding")
  static let didVerifyAccount = Notification.Name(rawValue: "\(prefix).didVerifyAccount")
  static let didRefreshUser = Notification.Name(rawValue: "\(prefix).didRefreshUser")
  static let didCompleteOnboarding = Notification.Name(rawValue: "\(prefix).didCompleteOnboarding")
  static let didFinishShareFeed = Notification.Name(rawValue: "\(prefix).didFinishShareFeed")
}
