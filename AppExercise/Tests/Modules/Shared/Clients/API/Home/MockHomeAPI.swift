//
//  MockHomeAPI.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

@testable import AppExercise

class MockHomeAPI: HomeAPI {
  var errorToReturn: Error?

  private(set) var getImageSearchCallCount = 0

  func reset() {
    errorToReturn = nil
  }
}

extension MockHomeAPI {
  func getImageSearch(
    params: FlickrSearchRequestParam,
    onSuccess: @escaping SingleResult<FlickrPhotos>,
    onError: @escaping ErrorResult
  ) -> RequestProtocol {
    getImageSearchCallCount += 1

    if let e = errorToReturn {
      onError(e)
    } else {
      onSuccess(.init())
    }

    return DummyRequest()
  }
}
