//
//  FlickrSearchServiceProtocol.swift
//  AppExercise
//
//  Created by HUXLEY ALCAIN on 7/14/22.
//  Copyright © 2022 Huxley. All rights reserved.
//

import Foundation

protocol FlickrSearchServiceProtocol {
  func getImageSearch(
    params: FlickrSearchRequestParam,
    onSuccess: @escaping SingleResult<[FlickrItem]>,
    onError: @escaping ErrorResult
  )
}
