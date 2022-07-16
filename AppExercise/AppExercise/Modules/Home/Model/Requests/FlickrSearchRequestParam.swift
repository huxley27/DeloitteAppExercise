//
//  FlickrSearchRequestParam.swift
//  AppExercise
//
//  Created by HUXLEY ALCAIN on 7/14/22.
//  Copyright © 2022 Huxley. All rights reserved.
//

import Foundation

struct FlickrSearchRequestParam: APIRequestParameters {
  var method: Method
  var apiKey: String
  var text: String?
  var format: String
  var noJsonCallback: String
  var page: Int
  var perPage: Int
  
  enum Method: String, Codable {
    case recent = "flickr.photos.getRecent"
    case search = "flickr.photos.search"
  }
}

extension FlickrSearchRequestParam {
  var dictionary: [String: Any] {
    var dict: [String: Any] = [
      "method": method.rawValue,
      "api_key": apiKey,
      "format": format,
      "nojsoncallback": noJsonCallback,
      "page": page,
      "per_page": perPage
    ]

    if let text = text {
      dict["text"] = text
    }
    
    return dict
  }
}
