//
//  Bool+NumericValue.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import CoreGraphics
import Foundation

extension Bool {
  func intValue() -> Int {
    self ? 1 : 0
  }

  func floatValue() -> Float {
    Float(intValue())
  }

  func cgFloatValue() -> CGFloat {
    CGFloat(intValue())
  }
}
