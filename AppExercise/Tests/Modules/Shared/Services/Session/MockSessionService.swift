//
//  MockSessionService.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

@testable import AppExercise

class MockSessionService: SessionServiceProtocol {
  var onResumeSessionError: ErrorResult?

  var isActive: Bool = false
  var user: User?
  var hasSkippedEmailVerification: Bool = false

  private(set) var clearSessionCallCount: Int = 0
  private(set) var clearSessionShouldBroadcast: Bool?

  private(set) var recordEmailVerificationSkipCallCount: Int = 0

  private(set) var recordAddOTPEmailCompleteCallCount: Int = 0
}

// MARK: - Methods

extension MockSessionService {
  func clearSession(shouldBroadcast: Bool) {
    clearSessionCallCount += 1
    clearSessionShouldBroadcast = shouldBroadcast
  }

  func recordEmailVerificationSkip() {
    recordEmailVerificationSkipCallCount += 1
  }

  func recordAddOTPEmailComplete() {
    recordAddOTPEmailCompleteCallCount += 1
  }
}

// MARK: - Others

extension MockSessionService {
  func handleAuthResult() -> SingleResult<UserAuthResponse> {
    return { _ in }
  }

  func handleUserResult() -> SingleResult<User> {
    return { _ in }
  }

  func handleAvatarResult() -> SingleResult<Photo> {
    return { _ in }
  }

  func handleOnboardingFinish() -> VoidResult {
    return {}
  }

  func handleDeAuth() -> BoolResult {
    return { _ in }
  }

  func handleDeAuthError() -> ErrorResult {
    return { _ in }
  }

  func handleUnauthorizedError() -> VoidResult {
    return {}
  }
}
