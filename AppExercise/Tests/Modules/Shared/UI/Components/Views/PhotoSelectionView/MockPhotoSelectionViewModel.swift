//
//  MockPhotoSelectionViewModel.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2021 Huxley. All rights reserved.
//

import Foundation

@testable import AppExercise

class MockPhotoSelectionViewModel: PhotoSelectionViewModelProtocol {
  var onRefresh: VoidResult?

  var dataSource: [PhotoSelectionCellViewModelProtocol] = []
  var maxNumberOfPhotos: Int?
  var allowRearrange: Bool = false

  private(set) var addPhotosCallCount: Int = 0
  private(set) var addPhotosValue: [Data]?

  private(set) var removePhotoCallCount: Int = 0
  private(set) var removePhotoIndex: Int?

  private(set) var movePhotoCallCount: Int = 0
  private(set) var movePhotoFromIndex: Int?
  private(set) var movePhotoToIndex: Int?
}

// MARK: - Methods

extension MockPhotoSelectionViewModel {
  func addPhotos(_ photosData: [Data]) {
    addPhotosCallCount += 1
    addPhotosValue = photosData
  }

  func removePhoto(at index: Int) {
    removePhotoCallCount += 1
    removePhotoIndex = index
  }

  func movePhoto(
    fromIndex: Int,
    toIndex: Int
  ) {
    movePhotoCallCount += 1
    movePhotoFromIndex = fromIndex
    movePhotoToIndex = toIndex
  }
}
