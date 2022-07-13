//
//  PhotoSelectionCellTests.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2021 Huxley. All rights reserved.
//  

import Foundation

import Quick
import Nimble

@testable import AppExercise

class PhotoSelectionCellTests: QuickSpec {
  override func spec() {
    describe("PhotoSelectionCell") {
      var sut: PhotoSelectionCell!
      var viewModel: MockPhotoSelectionCellViewModel!

      beforeEach {
        viewModel = MockPhotoSelectionCellViewModel()
        sut = PhotoSelectionCell.fromNib()
      }

      it("should have non-nil outlets") {
        expect(sut.imageView).toNot(beNil())
        expect(sut.removeButton).toNot(beNil())
      }
      
      it("should call onRemoveButtonTap callback closure once on tap of removeButton") {
        var onRemoveButtonTapCallCount = 0
        sut.onRemoveButtonTap = { onRemoveButtonTapCallCount += 1 }
        
        sut.removeButton.tap()
        
        expect(onRemoveButtonTapCallCount).to(equal(1))
      }
      
      context("when viewModel.imageData is non-nil") {
        beforeEach {
          viewModel.imageData = .dummyImageData
          
          sut.viewModel = viewModel
        }
        
        it("should set sut.imageView.image") {
          expect(sut.imageView.image).toNot(beNil())
        }
      }
    }
  }
}
