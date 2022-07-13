//
//  APMultilineTextFieldTests.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

import Nimble
import Quick

@testable import AppExercise

class APMultilineTextFieldTests: QuickSpec, EndpointResponseSpec {
  override func spec() {
    describe("APMultilineTextField") {
      var sut: APMultilineTextField!

      beforeEach {
        sut = APMultilineTextField()
      }

      afterEach {
        sut = nil
      }

      context("when minHeight is set") {
        context("to 0") {
          it("should add a constraint on set of minHeight to value > 0") {
            expect(sut.textView?.constraints).to(beEmpty())

            sut.minHeight = 0

            expect(sut.textView?.constraints).to(beEmpty())
          }
        }

        context("to > 0") {
          it("should add a constraint on set of minHeight to value > 0") {
            expect(sut.textView?.constraints).to(beEmpty())

            sut.minHeight = 1

            expect(sut.textView?.constraints).to(haveCount(1))
          }
        }
      }

      context("when charLimit") {
        var result1: Bool!
        var result2: Bool!
        var result3: Bool!

        afterEach {
          result1 = nil
          result2 = nil
          result3 = nil
        }

        func generateResults() {
          let tv = sut.textView!
          let delegate = tv.delegate

          result1 = delegate?.textView?(tv, shouldChangeTextIn: NSRange(location: 0, length: 1), replacementText: "A")
          result2 = delegate?.textView?(tv, shouldChangeTextIn: NSRange(location: 0, length: 10), replacementText: "01234456789")
          result3 = delegate?.textView?(tv, shouldChangeTextIn: NSRange(location: 0, length: 100), replacementText: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a,")
        }

        context("to 0") {
          beforeEach {
            sut.charLimit = 0
          }

          it("textView.delegate.shouldChangeTextIn should always return true") {
            generateResults()

            expect(result1).to(beTrue())
            expect(result2).to(beTrue())
            expect(result3).to(beTrue())
          }
        }

        context("to > 0 and charLimitLabel is set after") {
          var charLimitLabel: UILabel!

          beforeEach {
            sut.charLimit = 20

            charLimitLabel = UILabel()
            sut.charLimitLabel = charLimitLabel
          }

          afterEach {
            sut.charLimit = 0
            charLimitLabel = nil
          }

          it("textView.delegate.shouldChangeTextIn should return correct Bool value") {
            generateResults()

            expect(result1).to(beTrue())
            expect(result2).to(beTrue())
            expect(result3).to(beFalse())
          }

          it("should correctly set charLimitLabel.text on text change 1") {
            sut.text = "0123456789"

            expect(charLimitLabel.text).toEventually(equal("10/20"))
          }

          it("should correctly set charLimitLabel.text on text change 2") {
            sut.text = "0123"

            expect(charLimitLabel.text).toEventually(equal("4/20"))
          }
        }
      }
    }
  }
}
