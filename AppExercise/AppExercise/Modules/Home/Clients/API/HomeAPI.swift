//
//  HomeAPI.swift
//  AppExercise
//
//  Created by HUXLEY ALCAIN on 7/14/22.
//  Copyright © 2022 Huxley. All rights reserved.
//

import Foundation

import Alamofire

protocol HomeAPI {
  @discardableResult
  func getImageSearch(
    params: FlickrSearchRequestParam,
    onSuccess: @escaping SingleResult<[FlickrItem]>,
    onError: @escaping ErrorResult
  ) -> RequestProtocol
}
