//
//  GenericPickerViewModelTests.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

import Nimble
import Quick

@testable import AppExercise

class GenericPickerViewModelTests: QuickSpec {
  override func spec() {
    describe("GenericPickerViewModel") {
      var sut: GenericPickerViewModel!

      beforeEach {
        sut = GenericPickerViewModel()
      }

      afterEach {
        sut = nil
      }

      it("should call onOptionsReload closure once on setOptions") {
        var onOptionsReloadCallCount = 0
        sut.onOptionsReload = {
          onOptionsReloadCallCount += 1
        }

        sut.setOptions([])

        expect(onOptionsReloadCallCount).toEventually(equal(1))
      }

      it("should pass index and call onOptionIndexSelect closure once on selectOption") {
        var passedIndex: Int?
        var onOptionIndexSelectCallCount = 0
        sut.onOptionIndexSelect = { index in
          passedIndex = index
          onOptionIndexSelectCallCount += 1
        }

        sut.selectOption(at: 11)

        expect(passedIndex).toEventually(equal(11))
        expect(onOptionIndexSelectCallCount).toEventually(equal(1))
      }

      it("should pass expected option and call onOptionSelect closure once on selectOption") {
        var passedOption: String?
        var onOptionSelectCallCount = 0
        sut.onOptionSelect = { option in
          passedOption = option
          onOptionSelectCallCount += 1
        }
        sut.setOptions(["A", "B", "C"])

        sut.selectOption(at: 1)

        expect(passedOption).toEventually(equal("B"))
        expect(onOptionSelectCallCount).toEventually(equal(1))
      }
    }
  }
}
