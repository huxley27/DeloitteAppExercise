//
//  MockErrorHandlingService.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

@testable import AppExercise

class MockErrorHandlingService: ErrorHandlingServiceProtocol {
  var errorToReturn: Error?
  
  var onUnauthorizedError: VoidResult?

  private(set) var processAPIErrorCallCount: Int = 0
  private(set) var processAPIErrorValue: APIClientError?

  private(set) var processErrorCallCount: Int = 0
  private(set) var processErrorValue: Error?
  private(set) var processErrorInfo: [String: Any]?
}

// MARK: - Methods

extension MockErrorHandlingService {
  func processAPIError(_ apiError: APIClientError) {
    processAPIErrorCallCount += 1
    processAPIErrorValue = apiError
  }

  func processError(_ error: Error) {
    processErrorCallCount += 1
    processErrorValue = error
  }

  func processError(
    _ error: Error,
    info: [String: Any]?
  ) {
    processErrorCallCount += 1
    processErrorValue = error
    processErrorInfo = info
  }
}
