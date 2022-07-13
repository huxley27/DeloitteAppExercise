//
//  APDateFieldTests.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//  

import Foundation

import Nimble
import Quick
import SwiftDate

@testable import AppExercise

class APDateFieldTests: QuickSpec, EndpointResponseSpec {
  override func spec() {
    describe("APDateField") {
      var sut: APDateField!
      
      beforeEach {
        sut = APDateField()
        sut.dateTextFormat = "MM/dd/yyyy"
      }
      
      afterEach {
        sut = nil
      }
      
      it("should have non-nil properties") {
        expect(sut.datePicker).toNot(beNil())
        expect(sut.doneButton).toNot(beNil())
      }
      
      it("should set datePicker as inputView") {
        expect(sut.inputView).to(be(sut.datePicker))
      }
      
      it("should set a toolbar with doneButton as inputAccessoryView") {
        expect(sut.inputAccessoryView).to(beAKindOf(UIToolbar.self))
        let toolbar = sut.inputAccessoryView as! UIToolbar
        expect(toolbar.items).to(contain(sut.doneButton))
      }
      
      it("should correctly set datePicker.date and text on setupFromDateText 1") {
        let expectedDate = Date(components: {
          $0.timeZone = .utc
          $0.month = 7
          $0.day = 9
          $0.year = 2020
        })
        sut.datePicker.date = .now
        
        sut.setupFromDateText("07/09/2020")
        
        expect(sut.datePicker.date).to(equal(expectedDate))
        expect(sut.text).to(equal("07/09/2020"))
      }
      
      it("should correctly set datePicker.date and text on setupFromDateText 2") {
        let expectedDate = Date(components: {
          $0.timeZone = .utc
          $0.month = 12
          $0.day = 25
          $0.year = 2010
        })
        sut.datePicker.date = .now
        
        sut.setupFromDateText("12/25/2010")
        
        expect(sut.datePicker.date).to(equal(expectedDate))
        expect(sut.text).to(equal("12/25/2010"))
      }
      
      it("should correctly set text when datePicker.date change is simulated") {
        let date = Date(components: {
          $0.timeZone = .utc
          $0.month = 02
          $0.day = 14
          $0.year = 2016
        })!
        expect(sut.text).to(beEmpty())
        
        sut.datePicker.date = date
        sut.datePicker.sendActions(for: .valueChanged)
        
        expect(sut.text).to(equal("02/14/2016"))
      }
    }
  }
}
