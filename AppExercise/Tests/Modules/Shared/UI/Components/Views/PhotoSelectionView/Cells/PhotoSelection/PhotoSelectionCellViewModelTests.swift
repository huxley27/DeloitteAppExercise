//
//  PhotoSelectionCellViewModelTests.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2021 Huxley. All rights reserved.
//

import Foundation
import UIKit

import Nimble
import Quick

@testable import AppExercise

class PhotoSelectionCellViewModelTests: QuickSpec {
  override func spec() {
    describe("PhotoSelectionCellViewModel") {
      var sut: PhotoSelectionCellViewModel!

      afterEach {
        sut = nil
      }

      context("when initialized with imageData") {
        beforeEach {
          sut = PhotoSelectionCellViewModel(
            imageData: .dummyImageData
          )
        }
        
        it("should have non-nil imageData") {
          expect(sut.imageData).toNot(beNil())
        }
        
        it("should have nil imageURL") {
          expect(sut.imageURL).to(beNil())
        }
      }

      context("when initialized with imageURL") {
        beforeEach {
          sut = PhotoSelectionCellViewModel(
            imageURL: .dummy
          )
        }
        
        it("should have non-nil imageURL") {
          expect(sut.imageURL).toNot(beNil())
        }
        
        it("should have nil imageData") {
          expect(sut.imageData).to(beNil())
        }
        
        it("should have non-nil imageData after setImageData") {
          expect(sut.imageData).to(beNil())
          
          sut.setImageData(.dummyImageData)
          
          
          expect(sut.imageData).toNot(beNil())
        }
      }
      
  
     }
  }
}
