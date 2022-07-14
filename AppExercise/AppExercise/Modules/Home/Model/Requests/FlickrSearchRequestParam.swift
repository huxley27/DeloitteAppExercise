//
//  FlickrSearchRequestParam.swift
//  AppExercise
//
//  Created by HUXLEY ALCAIN on 7/14/22.
//  Copyright © 2022 Huxley. All rights reserved.
//

import Foundation

struct FlickrSearchRequestParam: APIRequestParameters {
  var method: String
  var apiKey: String
  var text: String
  var format: String
  var noJsonCallback: String
  var page: Int
  var perPage: Int
}

extension FlickrSearchRequestParam {
  var dictionary: [String: Any] {
    let dict: [String: Any] = [
      "method": method,
      "api_key": apiKey,
      "text": text,
      "format": format,
      "nojsoncallback": noJsonCallback,
      "page": page,
      "per_page": perPage
    ]
        
    return dict
  }
}
