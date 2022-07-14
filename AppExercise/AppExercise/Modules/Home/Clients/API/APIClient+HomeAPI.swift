//
//  APIClient+HomeAPI.swift
//  AppExercise
//
//  Created by HUXLEY ALCAIN on 7/14/22.
//  Copyright © 2022 Huxley. All rights reserved.
//

import Alamofire
import Foundation

extension APIClient: HomeAPI {
  @discardableResult
  func getImageSearch(
    params: FlickrSearchRequestParam,
    onSuccess: @escaping SingleResult<FlickrPhotos>,
    onError: @escaping ErrorResult
  ) -> RequestProtocol {
    
    return request(
      "services/rest/",
      parameters: params.dictionary,
      success: decodeModel(
        onSuccess: onSuccess,
        onError: onError
      ),
      failure: onError
    )
  }
}
