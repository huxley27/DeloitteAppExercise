//
//  UserContactDetailsViewModelTests.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

import Nimble
import Quick

@testable import AppExercise

class UserContactDetailsViewModelTests: QuickSpec {
  override func spec() {
    describe("UserContactDetailsViewModel") {
      var sut: UserContactDetailsViewModel!
      var user: User!

      beforeEach {
        user = User(
          email: "Email",
          phoneNumber: "Mobile Number",
          fullName: "User Name",
          avatarPermanentThumbUrl: .dummy
        )
        sut = UserContactDetailsViewModel(
          user: user
        )
      }

      afterEach {
        sut = nil
        user = nil
      }

      it("should return correct imageURL") {
        expect(sut.imageURL.absoluteString).to(equal(URL.dummy.absoluteString))
      }

      it("should return correct nameText") {
        expect(sut.nameText).to(equal("User Name"))
      }

      it("should return correct emailText") {
        expect(sut.emailText).to(equal("Email"))
      }

      it("should return correct mobileNumberText") {
        expect(sut.mobileNumberText).to(equal("Mobile Number"))
      }
    }
  }
}
