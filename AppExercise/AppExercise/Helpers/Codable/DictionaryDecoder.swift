//
//  DictionaryDecoder.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2019 Huxley. All rights reserved.
//

import Foundation

class DictionaryDecoder {
  private let decoder = JSONDecoder()

  init() {}

  var dateDecodingStrategy: JSONDecoder.DateDecodingStrategy {
    set { decoder.dateDecodingStrategy = newValue }
    get { return decoder.dateDecodingStrategy }
  }

  var dataDecodingStrategy: JSONDecoder.DataDecodingStrategy {
    set { decoder.dataDecodingStrategy = newValue }
    get { return decoder.dataDecodingStrategy }
  }

  var nonConformingFloatDecodingStrategy: JSONDecoder.NonConformingFloatDecodingStrategy {
    set { decoder.nonConformingFloatDecodingStrategy = newValue }
    get { return decoder.nonConformingFloatDecodingStrategy }
  }

  var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy {
    set { decoder.keyDecodingStrategy = newValue }
    get { return decoder.keyDecodingStrategy }
  }

  func decode<T>(_ type: T.Type, from dictionary: [String: Any]) throws -> T where T: Decodable {
    let data = try JSONSerialization.data(withJSONObject: dictionary, options: [])
    return try decoder.decode(type, from: data)
  }
}
