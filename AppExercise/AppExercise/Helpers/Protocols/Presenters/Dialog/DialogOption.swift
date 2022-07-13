//
//  DialogOption.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

struct DialogOption {
  let title: String
  var onSelect: VoidResult = DefaultClosure.voidResult()
  var isPreferred: Bool = false
}

// MARK: - Equatable

extension DialogOption: Equatable {
  static func == (lhs: DialogOption, rhs: DialogOption) -> Bool {
    lhs.title == rhs.title
  }
}
