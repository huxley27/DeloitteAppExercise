//
//  FlickrPhotoTest.swift
//  Tests
//
//  Created by HUXLEY ALCAIN on 7/18/22.
//  Copyright © 2022 Huxley. All rights reserved.
//

import Foundation

import Nimble
import Quick

@testable import AppExercise

class FlickrPhotoTest: QuickSpec, EndpointResponseSpec {
  override func spec() {
    describe("FlickrPhotos") {
      var sut: FlickrPhotos!

      it("should be initializable") {
        sut = FlickrPhotos()
      }

      afterEach {
        sut = nil
      }
    }
  }
}
