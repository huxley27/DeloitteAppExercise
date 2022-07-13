//
//  Constants.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2018 Huxley. All rights reserved.
//

import Foundation

public typealias JSONDictionary = [String: Any]

// swiftlint:disable:next type_name
typealias S = R.string.localizable

struct Constants {
  struct Formatters {
    static let debugConsoleDateFormatter: DateFormatter = {
      let formatter = DateFormatter()
      formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
      formatter.timeZone = .utc
      return formatter
    }()
    
    static let birthdateFormatter: DateFormatter = {
      let formatter = DateFormatter()
      formatter.dateFormat = "yyyy-MM-dd"
      formatter.timeZone = .utc
      return formatter
    }()
  }
}
