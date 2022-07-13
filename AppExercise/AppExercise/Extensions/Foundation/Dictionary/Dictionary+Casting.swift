//
//  Dictionary+Casting.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

extension Dictionary where Key == String, Value == Any {
  subscript(string key: String) -> String {
    self[key] as? String ?? ""
  }

  subscript(stringOrNil key: String) -> String? {
    self[key] as? String
  }

  subscript(date key: String) -> Date {
    self[key] as? Date ?? Date()
  }

  subscript(dateOrNil key: String) -> Date? {
    self[key] as? Date
  }

  subscript(data key: String) -> Data {
    self[key] as? Data ?? Data()
  }

  subscript(dataOrNil key: String) -> Data? {
    self[key] as? Data
  }
}
