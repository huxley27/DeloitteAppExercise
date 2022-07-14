//
//  APIPage.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation
import Alamofire

struct APIPage: Equatable {
  let index: Int
  let size: Int
  
  var asParameters: Parameters {
    var params: Parameters = [:]

    params["page"] = index
    params["per_page"] = size

    return params
  }
}

// MARK: - Static

extension APIPage {
  static var `default`: APIPage { .init(index: 1, size: App.shared.config.defaultPageSize) }
}
