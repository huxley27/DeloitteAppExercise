//
//  PostRegisterDeviceTests.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

import Nimble
import Quick

@testable import AppExercise

class PostRegisterDeviceTests: QuickSpec, EndpointResponseSpec {
  override func spec() {
    describe("PostRegisterDevice") {
      var apiResponse: APIResponse!

      context("when decoding status 200 response") {
        beforeEach {
          apiResponse = self.decodeResponseValue(statusCode: .ok)
        }

        it("should have non-nil decoded response") {
          expect(apiResponse).toNot(beNil())
        }

        it("should have 200 status code") {
          expect(apiResponse.statusCode).to(equal(.ok))
        }
      }

      afterEach {
        apiResponse = nil
      }
    }
  }
}
