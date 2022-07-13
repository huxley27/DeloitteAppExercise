//
//  Int+String.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2019 Huxley. All rights reserved.
//

import Foundation

extension Int {
  func twoDigitString() -> String {
    return String(format: "%02d", self)
  }
}
