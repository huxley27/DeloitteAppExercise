//
//  MockMediaAPI.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2021 Huxley. All rights reserved.
//  

import Foundation

@testable import AppExercise

class MockMediaAPI: MediaAPI {
  var errorToReturn: Error?
  var progressToReturn: Progress?

  private(set) var postUploadMediaCallCount: Int = 0
  private(set) var postUploadMediaData: Data?
}

// MARK: - Methods

extension MockMediaAPI {
  func postUploadMedia(
    with data: Data,
    onProgress: @escaping SingleResult<Progress>,
    onSuccess: @escaping SingleResult<Photo>,
    onError: @escaping ErrorResult
  ) {
    postUploadMediaCallCount += 1
    postUploadMediaData = data
    
    if let e = errorToReturn {
      onError(e)
    } else if let p = progressToReturn {
      onProgress(p)
    } else {
      onSuccess(.init())
    }
  }
}
