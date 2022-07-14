//
//  FlickrSearchService.swift
//  AppExercise
//
//  Created by HUXLEY ALCAIN on 7/14/22.
//  Copyright © 2022 Huxley. All rights reserved.
//

import Foundation

class FlickrSearchService: FlickrSearchServiceProtocol {
  
  private let api: HomeAPI

  init(api: HomeAPI) {
    self.api = api
  }
}

// MARK: - Methods

extension FlickrSearchService {
  func getImageSearch(
    params: FlickrSearchRequestParam,
    onSuccess: @escaping SingleResult<[FlickrItem]>,
    onError: @escaping ErrorResult
  ) {
    api.getImageSearch(
      params: params,
      onSuccess: onSuccess,
      onError: onError
    )
  }
}
