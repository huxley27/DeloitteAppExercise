//
//  DebouncedButtonViewTests.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2021 Huxley. All rights reserved.
//  

import Foundation

import Quick
import Nimble

@testable import AppExercise

class DebouncedButtonViewTests: QuickSpec {
  override func spec() {
    describe("DebouncedButtonView") {
      var sut: DebouncedButtonView!

      beforeEach {
        sut = DebouncedButtonView()
      }

      it("should have non-nil outlets") {
        expect(sut.contentView).toNot(beNil())
        expect(sut.button).toNot(beNil())
        expect(sut.timerProgressView).toNot(beNil())
      }
      
      it("should set button.isEnabled and timerProgressView.isHidden to false on startTimer") {
        expect(sut.button.isEnabled).to(beTrue())
        expect(sut.timerProgressView.isHidden).to(beTrue())
        sut.debounceInSeconds = 0.01
        
        sut.startTimer()
        
        expect(sut.button.isEnabled).to(beFalse())
        expect(sut.timerProgressView.isHidden).to(beFalse())
      }
      
      it("should reset button.isEnabled and timerProgressView.isHidden to true on startTimer after debounceInSeconds has elapsed") {
        sut.startTimer()
        expect(sut.button.isEnabled).to(beFalse())
        expect(sut.timerProgressView.isHidden).to(beFalse())
        sut.debounceInSeconds = 0.01
        
        expect(sut.button.isEnabled).toEventuallyNot(beTrue())
        expect(sut.timerProgressView.isHidden).toEventually(beTrue())
      }
    }
  }
}
