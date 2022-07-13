//
//  MockPhotoSelectionViewModel.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2021 Huxley. All rights reserved.
//

import Foundation

@testable import AppExercise

class MockPhotoSelectionCellViewModel: PhotoSelectionCellViewModelProtocol {
  var id: Int?
  var imageData: Data?
  var imageURL: URL?

  private(set) var setImageDataCallCount: Int = 0
  private(set) var setImageDataValue: Data?
}

// MARK: - Methods

extension MockPhotoSelectionCellViewModel {
  func setImageData(_ imageData: Data) {
    setImageDataCallCount += 1
    setImageDataValue = imageData
  }
}
