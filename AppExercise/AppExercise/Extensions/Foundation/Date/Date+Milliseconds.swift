//
//  Date+Milliseconds.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

extension Date {
  /// Returns a Unix timestamp in milliseconds.
  func millisecondsSince1970() -> Double {
    return (timeIntervalSince1970 * 1000).rounded()
  }

  /// Creates a Date instance from a milliseconds value.
  init(millisecondsSince1970: Double) {
    self.init(timeIntervalSince1970: millisecondsSince1970 / 1000)
  }
}
