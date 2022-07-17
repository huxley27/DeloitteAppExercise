//
//  GetImageSearchTests.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

import Nimble
import Quick

@testable import AppExercise

class GetImageSearchTests: QuickSpec, EndpointResponseSpec {
  override func spec() {
    describe("GetImageSearch") {
      var apiResponse: APIResponse!

      context("when decoding status 200 response") {
        beforeEach {
          apiResponse = self.decodeResponseValue(statusCode: .ok)
        }

        it("should have non-nil decoded response") {
          expect(apiResponse).toNot(beNil())
        }

        it("should have ok status") {
          expect(apiResponse.stat).to(equal("ok"))
        }
      }

      afterEach {
        apiResponse = nil
      }
    }
  }
}
