//
//  PhotoTests.swift
//  Tests
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

import Nimble
import Quick

@testable import AppExercise

class PhotoTests: QuickSpec, EndpointResponseSpec {
  override func spec() {
    describe("Photo") {
      var sut: Photo!

      it("should be initializable") {
        sut = Photo()
      }

      afterEach {
        sut = nil
      }
    }
  }
}
