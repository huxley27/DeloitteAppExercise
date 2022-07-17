//
//  StringProtocol+SubstringIndices.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

// Reference: https://stackoverflow.com/a/32306142

extension StringProtocol {
  func index<S: StringProtocol>(
    of string: S,
    options: String.CompareOptions = []
  ) -> Index? {
    range(of: string, options: options)?.lowerBound
  }

  func endIndex<S: StringProtocol>(
    of string: S,
    options: String.CompareOptions = []
  ) -> Index? {
    range(of: string, options: options)?.upperBound
  }

  func indices<S: StringProtocol>(
    of string: S,
    options: String.CompareOptions = []
  ) -> [Index] {
    var indices: [Index] = []
    var startIndex = self.startIndex
    while startIndex < endIndex,
      let range = self[startIndex...]
      .range(of: string, options: options) {
      indices.append(range.lowerBound)
      startIndex = range.lowerBound < range.upperBound ? range.upperBound :
        index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
    }
    return indices
  }

  func ranges<S: StringProtocol>(
    of string: S,
    options: String.CompareOptions = []
  ) -> [Range<Index>] {
    var result: [Range<Index>] = []
    var startIndex = self.startIndex
    while startIndex < endIndex,
      let range = self[startIndex...]
      .range(of: string, options: options) {
      result.append(range)
      startIndex = range.lowerBound < range.upperBound ? range.upperBound :
        index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
    }
    return result
  }
}
