//
//  PhotoSelectionViewTests.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2021 Huxley. All rights reserved.
//  

import Foundation

import Quick
import Nimble

@testable import AppExercise

class PhotoSelectionViewTests: QuickSpec {
  override func spec() {
    describe("PhotoSelectionView") {
      var sut: PhotoSelectionView!
      var viewModel: MockPhotoSelectionViewModel!

      beforeEach {
        viewModel = MockPhotoSelectionViewModel()
        sut = PhotoSelectionView()
        sut.viewModel = viewModel
      }

      it("should have non-nil outlets") {
        expect(sut.contentView).toNot(beNil())
        expect(sut.collectionView).toNot(beNil())
        expect(sut.collectionViewHeightALC).toNot(beNil())
      }
      
      it("should have non-nil properties") {
        expect(sut.control).toNot(beNil())
      }
      
      it("should set collectionView delegates and dataSource to self") {
        expect(sut.collectionView.dataSource).to(be(sut))
        expect(sut.collectionView.delegate).to(be(sut))
        expect(sut.collectionView.dragDelegate).to(be(sut))
        expect(sut.collectionView.dropDelegate).to(be(sut))
      }
      
      it("should set collectionView.dragInteractionEnabled based on viewModel.allowRearrange") {
        expect(sut.collectionView.dragInteractionEnabled).to(beFalse())
        
        viewModel.allowRearrange = true
        sut.viewModel = viewModel
        
        expect(sut.collectionView.dragInteractionEnabled).to(beTrue())
      }
      
      it("should bind collectionView.contentSize.height to collectionViewHeightALC.constant") {
        sut.collectionViewHeightALC.constant = 0
        
        sut.collectionView.contentSize = CGSize(
          width: 0,
          height: 1
        )
        
        expect(sut.collectionViewHeightALC.constant).toEventually(equal(1))
      }
    }
  }
}
