//
//  ErrorHandlingService.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

class ErrorHandlingService: ErrorHandlingServiceProtocol {
  var onUnauthorizedError: VoidResult?
}

// MARK: - Methods

extension ErrorHandlingService {
  func processAPIError(_ apiError: APIClientError) {
    processError(apiError)

    switch apiError {
    case let .failedRequest(info):
      processFailedRequest(withInfo: info)
    case .dataNotFound, .unknown:
      break
    }
  }

  func processError(_ error: Error) {
    processError(
      error,
      info: nil
    )
  }

  func processError(
    _ error: Error,
    info: [String: Any]?
  ) {
    recordError(
      error,
      info: info
    )
  }
}

// MARK: - Helpers

private extension ErrorHandlingService {
  func processFailedRequest(
    withInfo info: APIClientFailedRequestInfoType
  ) {
    switch info.errorCode {
    case .httpUnauthorized:
      onUnauthorizedError?()
    case .emailNotFound,
         .usernameNotFound,
         .passwordNotSupported,
         .unknown:
      break
    }
  }

  func recordError(
    _ error: Error,
    info: [String: Any]?
  ) {
    debugLog(String(describing: error))

    if let userInfo = info {
      debugLog("other info: \(String(describing: userInfo))")
    }
  }
}
