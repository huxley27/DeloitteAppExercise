//
//  Identifiable.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2019 Huxley. All rights reserved.
//

import Foundation

protocol Identifiable {
  associatedtype ValueType: CustomStringConvertible

  var id: ValueType { get }
  var idString: String { get }
}

extension Identifiable {
  var idString: String { id.description }
}

extension Equatable where Self: Identifiable {
  static func == (lhs: Self, rhs: Self) -> Bool {
    return lhs.idString == rhs.idString
  }
}
