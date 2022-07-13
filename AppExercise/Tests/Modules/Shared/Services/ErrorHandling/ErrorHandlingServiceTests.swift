//
//  ErrorHandlingServiceTests.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

import Nimble
import Quick

@testable import AppExercise

class ErrorHandlingServiceTests: QuickSpec {
  override func spec() {
    describe("ErrorHandlingService") {
      var sut: ErrorHandlingService!

      beforeEach {
        sut = ErrorHandlingService()
      }

      afterEach {
        sut = nil
      }

      it("should call onUnauthorizedError callback once on processAPIError when .httpUnauthorized error code is used") {
        var onUnauthorizedErrorCallCount = 0
        sut.onUnauthorizedError = { onUnauthorizedErrorCallCount += 1 }

        let testInfo = APIClientFailedRequestInfo(
          testErrorCode: .httpUnauthorized
        )
        sut.processAPIError(.failedRequest(testInfo))

        expect(onUnauthorizedErrorCallCount).to(equal(1))
      }
    }
  }
}
