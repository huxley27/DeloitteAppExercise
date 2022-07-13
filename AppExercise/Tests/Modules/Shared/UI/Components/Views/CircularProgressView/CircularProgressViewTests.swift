//
//  CircularProgressViewTests.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2021 Huxley. All rights reserved.
//  

import Foundation

import Quick
import Nimble

@testable import AppExercise

class CircularProgressViewTests: QuickSpec {
  override func spec() {
    describe("CircularProgressView") {
      var sut: CircularProgressView!

      beforeEach {
        sut = CircularProgressView(frame: .zero)
      }

      it("should call onComplete callback once on animate") {
        var onCompleteCallCount = 0
        sut.animate(
          duration: 0.01,
          onComplete: { onCompleteCallCount += 1 }
        )
        
        expect(onCompleteCallCount).toEventually(equal(1))
      }
    }
  }
}
