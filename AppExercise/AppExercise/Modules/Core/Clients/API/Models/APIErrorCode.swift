//
//  APIErrorCode.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

enum APIErrorCode: String, Codable {
  case httpUnauthorized = "HTTP_UNAUTHORIZED"
  case emailNotFound = "EMAIL_NOT_FOUND"
  case usernameNotFound = "USERNAME_NOT_FOUND"
  case passwordNotSupported = "PASSWORD_NOT_SUPPORTED"

  // Add other error codes here with required handling

  case unknown = "UNKNOWN_ERROR"

  static let `default`: APIErrorCode = .unknown
}
