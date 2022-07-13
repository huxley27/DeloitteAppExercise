//
//  UserContactDetailsViewTests.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

import Nimble
import Quick

@testable import AppExercise

class UserContactDetailsViewTests: QuickSpec {
  override func spec() {
    describe("UserContactDetailsView") {
      var sut: UserContactDetailsView!
      var viewModel: MockUserContactDetailsViewModel!

      beforeEach {
        viewModel = MockUserContactDetailsViewModel()

        viewModel.nameText = "Seller Name"
        viewModel.emailText = "Email"
        viewModel.mobileNumberText = "Mobile Number"

        sut = UserContactDetailsView()
        sut.viewModel = viewModel
      }

      it("should have non-nil outlets") {
        expect(sut.contentView).toNot(beNil())
        expect(sut.imageView).toNot(beNil())
        expect(sut.nameLabel).toNot(beNil())
        expect(sut.emailLabel).toNot(beNil())
        expect(sut.mobileNumberLabel).toNot(beNil())
      }

      it("should set profilePicPlaceholder as image placeholder") {
        expect(sut.imageView.image).to(equal(R.image.profilePicPlaceholder()!))
      }

      it("should set nameLabel.text to viewModel.nameText") {
        expect(sut.nameLabel.text).to(equal("Seller Name"))
      }

      it("should set emailLabel.text to viewModel.emailText") {
        expect(sut.emailLabel.text).to(equal("Email"))
      }

      it("should set mobileNumberLabel.text to viewModel.mobileNumberText") {
        expect(sut.mobileNumberLabel.text).to(equal("Mobile Number"))
      }

      it("should set emailLabel.isHidden to true when viewModel.emailText is nil") {
        viewModel.emailText = nil
        sut.viewModel = viewModel

        expect(sut.emailLabel.isHidden).to(beTrue())
      }

      it("should set mobileNumberLabel.isHidden to true when viewModel.mobileNumberText is nil") {
        viewModel.mobileNumberText = nil
        sut.viewModel = viewModel

        expect(sut.mobileNumberLabel.isHidden).to(beTrue())
      }
    }
  }
}
