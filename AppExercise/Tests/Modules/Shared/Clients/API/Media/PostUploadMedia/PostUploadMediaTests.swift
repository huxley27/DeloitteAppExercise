// 
//  PostUploadMediaTests.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2021 Huxley. All rights reserved.
//  

import Foundation

import Quick
import Nimble

@testable import AppExercise

class PostUploadMediaTests: QuickSpec, EndpointResponseSpec {
  override func spec() {
    describe("PostUploadMedia") {
      var apiResponse: APIResponse!
      var data: Photo!
      
      afterEach {
        apiResponse = nil
        data = nil
      }
      
      context("when decoding status 200 response") {
        beforeEach {
          apiResponse = self.decodeResponseValue(statusCode: .ok)
        }
        
        it("should have non-nil decoded response") {
          expect(apiResponse).toNot(beNil())
        }
        
        it("should have 200 status code") {
          data = apiResponse.decodedValue()
          
          expect(data).toNot(beNil())
        }
      }
    }
  }
}
