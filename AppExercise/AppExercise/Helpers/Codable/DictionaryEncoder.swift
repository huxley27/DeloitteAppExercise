//
//  DictionaryEncoder.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2019 Huxley. All rights reserved.
//

import Foundation

class DictionaryEncoder {
  private let encoder = JSONEncoder()

  init() {}

  var dateEncodingStrategy: JSONEncoder.DateEncodingStrategy {
    set { encoder.dateEncodingStrategy = newValue }
    get { return encoder.dateEncodingStrategy }
  }

  var dataEncodingStrategy: JSONEncoder.DataEncodingStrategy {
    set { encoder.dataEncodingStrategy = newValue }
    get { return encoder.dataEncodingStrategy }
  }

  var nonConformingFloatEncodingStrategy: JSONEncoder.NonConformingFloatEncodingStrategy {
    set { encoder.nonConformingFloatEncodingStrategy = newValue }
    get { return encoder.nonConformingFloatEncodingStrategy }
  }

  var keyEncodingStrategy: JSONEncoder.KeyEncodingStrategy {
    set { encoder.keyEncodingStrategy = newValue }
    get { return encoder.keyEncodingStrategy }
  }

  /// - parameter value: Any **Encodable** conforming value.
  /// - parameter compact: If True, removes keyval pairs with nil values.
  func encode<T>(_ value: T, compact: Bool = true) throws -> [String: Any] where T: Encodable {
    let data = try encoder.encode(value)
    let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
    return compact ? dictionary.filter { !($0.value is NSNull) } : dictionary
  }
}
