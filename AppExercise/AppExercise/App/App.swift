//
//  App.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2018 Huxley. All rights reserved.
//

import UIKit

/// This is our main application object. This holds instances of all the services available
/// in the app like the APIClient, SessionService, etc.
///
/// IMPORTANT:
/// - Defer creation of service instance up to the point where it's first needed.
///
class App {
  static let shared = App()

  private(set) var config: AppConfigProtocol!

  private(set) var api: APIClient!

  // MARK: Shared

  private(set) var errorHandling: ErrorHandlingServiceProtocol!


  // MARK: Initialization

  private init() {
    
  }

  func bootstrap(
    with application: UIApplication,
    launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) {
    config = AppConfig()
    api = APIClient(
      baseURL: URL(string: config.apiUrl)!,
      version: "v1"
    )

    errorHandling = ErrorHandlingService()

    setup()
  }
}

// MARK: - Setup

extension App {
  func setup() {
    
  }
}

// MARK: - App Info

extension App {
  static var bundleIdentifier: String? {
    return Bundle.main.bundleIdentifier
  }

  /// A dictionary, constructed from the bundle’s Info.plist file.
  static var info: [String: Any] {
    return Bundle.main.infoDictionary ?? [:]
  }

  static var displayName: String {
    return (info["CFBundleDisplayName"] as? String) ?? "AppExercise"
  }

  /// Alias for `CFBundleShortVersionString`.
  static var releaseVersion: String {
    return (info["CFBundleShortVersionString"] as? String) ?? "1.0"
  }

  /// Alias for `CFBundleVersion`.
  static var buildNumber: String {
    return (info["CFBundleVersion"] as? String) ?? "1"
  }

  static var icon: UIImage {
    guard
      let icons = info["CFBundleIcons"] as? [String: Any],
      let primaryIcon = icons["CFBundlePrimaryIcon"] as? [String: Any],
      let iconFiles = primaryIcon["CFBundleIconFiles"] as? [String],
      let lastIcon = iconFiles.last,
      let appIcon = UIImage(named: lastIcon)
    else {
      preconditionFailure("app icon should not be nil")
    }

    return appIcon
  }
}

/// Use this for all App-level errors.
// TODO: Add conformance to CustomNSError.
enum AppError: Error {
  case unauthorized(_ reason: String)
  case unknown
}

extension AppError: LocalizedError {
  var errorDescription: String? {
    switch self {
    case .unauthorized:
      return S.errorDevAuthorization()
    default:
      return S.errorDevSomethingWrong()
    }
  }

  var failureReason: String? {
    switch self {
    case let .unauthorized(reason):
      return reason
    default:
      return S.errorDevUnknown()
    }
  }
}
