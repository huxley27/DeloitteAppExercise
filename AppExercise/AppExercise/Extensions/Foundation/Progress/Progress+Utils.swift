//
//  Progress+Utils.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2021 Huxley. All rights reserved.
//  

import Foundation

extension Progress {
  /// Value should be from 0 to 1.
  convenience init(value: Float) {
    let adjustedExpectedProgress = min(value, 1)
    self.init(totalUnitCount: 100)
    self.completedUnitCount = Int64(Float(100 * adjustedExpectedProgress))
  }
}
