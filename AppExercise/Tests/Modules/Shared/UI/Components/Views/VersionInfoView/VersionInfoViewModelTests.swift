//
//  VersionInfoViewModelTests.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2021 Huxley. All rights reserved.
//  

import Foundation

import Quick
import Nimble

@testable import AppExercise

class VersionInfoViewModelTests: QuickSpec {
  override func spec() {
    describe("VersionInfoViewModel") {
      var sut: VersionInfoViewModel!

      beforeEach {
        sut = VersionInfoViewModel()
      }

      afterEach {
        sut = nil
      }
      
      it("should return versionText in correct format") {
        expect(sut.versionText).to(equal("Version \(App.releaseVersion)-\(App.buildNumber)"))
      }
    }
  }
}
