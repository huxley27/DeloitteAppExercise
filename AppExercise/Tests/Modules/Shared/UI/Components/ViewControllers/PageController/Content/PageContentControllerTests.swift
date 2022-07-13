//
//  PageContentControllerTests.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

import Nimble
import Quick

@testable import AppExercise

class PageContentControllerTests: QuickSpec {
  override func spec() {
    describe("PageContentController") {
      var sut: PageContentController!
      var viewModel: MockPageContentViewModel!

      beforeEach {
        viewModel = MockPageContentViewModel()
        viewModel.title = "Title"
        viewModel.description = "Description"
        viewModel.image = R.image.account()!
        viewModel.titleColor = .red
        viewModel.descriptionColor = .blue
        viewModel.imageBackgroundColor = .green
        viewModel.imageContentMode = .center
        viewModel.imageClipsToBounds = true
        
        sut = R.storyboard.appIntro.pageContentController()!
        sut.viewModel = viewModel
      }

      afterEach {
        sut = nil
        viewModel = nil
      }

      context("when view is loaded") {
        beforeEach {
          sut.loadViewIfNeeded()
        }

        it("should have non-nil outlets") {
          expect(sut.bgTopPaddingView).toNot(beNil())
          expect(sut.backgroundView).toNot(beNil())
          expect(sut.imageView).toNot(beNil())
          expect(sut.titleLabel).toNot(beNil())
          expect(sut.descriptionLabel).toNot(beNil())
        }

        it("should set titleLabel.text to viewModel.title") {
          expect(sut.titleLabel.text).to(equal("Title"))
        }
        
        it("should set descriptionLabel.text to viewModel.description") {
          expect(sut.descriptionLabel.text).to(equal("Description"))
        }
        
        it("should set imageView.image to viewModel.image") {
          expect(sut.imageView.image).to(equal(R.image.account()!))
        }
        
        it("should set titleLabel.textColor to viewModel.titleColor") {
          expect(sut.titleLabel.textColor).to(equal(.red))
        }
        
        it("should set descriptionLabel.textColor to viewModel.descriptionColor") {
          expect(sut.descriptionLabel.textColor).to(equal(.blue))
        }
        
        it("should set backgroundView.backgroundColor to viewModel.imageBackgroundColor") {
          expect(sut.backgroundView.backgroundColor).to(equal(.green))
          expect(sut.bgTopPaddingView.backgroundColor).to(equal(.green))
        }
        
        it("should set imageView.contentMode to viewModel.imageContentMode") {
          expect(sut.imageView.contentMode).to(equal(.center))
        }
        
        it("should set imageView.clipsToBounds to viewModel.imageClipsToBounds") {
          expect(sut.imageView.clipsToBounds).to(beTrue())
        }
      }
    }
  }
}
