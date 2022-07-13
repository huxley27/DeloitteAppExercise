//
//  VersionInfoViewTests.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2021 Huxley. All rights reserved.
//

import Foundation

import Nimble
import Quick

@testable import AppExercise

class VersionInfoViewTests: QuickSpec {
  override func spec() {
    describe("VersionInfoView") {
      var sut: VersionInfoView!
      var viewModel: MockVersionInfoViewModel!

      beforeEach {
        viewModel = MockVersionInfoViewModel()
        viewModel.versionText = "VersionText"

        sut = VersionInfoView()
        sut.viewModel = viewModel
      }

      it("should have non-nil outlets") {
        expect(sut.contentView).toNot(beNil())
        expect(sut.versionLabel).toNot(beNil())
      }

      it("should set versionLabel.text from viewModel.versionText") {
        expect(sut.versionLabel.text).to(equal("VersionText"))
      }
    }
  }
}
