//
//  GenericPickerViewTests.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

import Nimble
import Quick

@testable import AppExercise

class GenericPickerViewTests: QuickSpec {
  override func spec() {
    describe("GenericPickerView") {
      var sut: GenericPickerView!
      var viewModel: MockGenericPickerViewModel!

      beforeEach {
        viewModel = MockGenericPickerViewModel()
        viewModel.options = ["A", "B", "C"]

        sut = GenericPickerView()

        sut.viewModel = viewModel
      }

      afterEach {
        viewModel = nil
        sut = nil
      }

      it("should set viewModel.onOptionSelect") {
        expect(viewModel.onOptionSelect).toNot(beNil())
      }

      it("should set viewModel.onOptionsReload") {
        expect(viewModel.onOptionsReload).toNot(beNil())
      }

      it("should set reloadComponents on call of viewModel.onOptionsReload") {
        expect(sut.numberOfRows(inComponent: 0)).to(equal(3))
        viewModel.options = [""]

        viewModel.onOptionsReload?()

        expect(sut.numberOfRows(inComponent: 0)).to(equal(1))
      }

      context("when textField is set") {
        var textField: UITextField!

        beforeEach {
          textField = UITextField()
          sut.textField = textField
        }

        afterEach {
          textField = nil
        }

        it("should set textField.inputView to itself") {
          expect(textField.inputView).to(be(sut))
        }

        it("should set textField.inputAccessoryView to a UIToolbar") {
          expect(textField.inputAccessoryView).to(beAKindOf(UIToolbar.self))
        }

        it("should set toolbar items") {
          let toolbar = textField.inputAccessoryView as! UIToolbar

          expect(toolbar.items?.count).to(equal(2))
        }

        it("should pass current selected index and call viewModel.selectOption on tap of doneButton in toolbar") {
          let toolbar = textField.inputAccessoryView as! UIToolbar
          let toolbarItems = toolbar.items!
          let doneButton = toolbarItems.last!
          sut.selectRow(2, inComponent: 0, animated: false)
          expect(viewModel.selectOptionIndex).to(beNil())
          expect(viewModel.selectOptionCallCount).to(equal(0))

          doneButton.tap()

          expect(viewModel.selectOptionIndex).to(equal(2))
          expect(viewModel.selectOptionCallCount).to(equal(1))
        }

        it("should call viewModel.selectOption and pass index on simulate of select") {
          expect(viewModel.selectOptionIndex).to(beNil())
          expect(viewModel.selectOptionCallCount).to(equal(0))

          sut.simulateSelect(at: 1)

          expect(viewModel.selectOptionIndex).to(equal(1))
          expect(viewModel.selectOptionCallCount).to(equal(1))
        }

        it("should set textField.text on call of viewModel.onOptionSelect") {
          expect(textField.text).to(equal(""))

          viewModel.onOptionSelect?("A")

          expect(textField.text).to(equal("A"))
        }
      }

      describe("dataSource") {
        it("should return 1 component only") {
          expect(sut.dataSource?.numberOfComponents(in: sut)).to(equal(1))
        }

        it("should return numberOfRowsInComponent equal to viewModel.options.count") {
          expect(sut.dataSource?.pickerView(sut, numberOfRowsInComponent: 0)).to(equal(viewModel.options?.count))
        }
      }
    }
  }
}
