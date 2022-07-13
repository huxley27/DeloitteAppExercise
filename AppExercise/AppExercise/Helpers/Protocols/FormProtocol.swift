//
//  FormProtocol.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

protocol FormProtocol {
  associatedtype RawInput
  associatedtype ValidInput
  associatedtype ValidationHandlers

  static func validate(
    rawInput: RawInput,
    validationHandlers: ValidationHandlers
  ) -> ValidInput?
}
