//
//  Sequence+Unique.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2019 Huxley. All rights reserved.
//

import Foundation

extension Sequence where Iterator.Element: Hashable {
  /// Returns a new copy of this sequence excluding duplicates. Order of elements is preserved.
  ///
  /// Example usage in Array type:
  ///
  ///     let intArray = [1, 2, 3, 2, 4, 1, 6]
  ///     print(intArray.unique()) // [1, 2, 3, 4, 6]
  ///
  ///     let stringArray = ["a", "b", "c", "a", "c", "d"]
  ///     print(stringArray.unique()) // ["a", "b", "c", "d"]
  ///
  func unique() -> [Iterator.Element] {
    var seen: [Iterator.Element: Bool] = [:]
    return filter { seen.updateValue(true, forKey: $0) == nil }
  }
}
