//
//  InputValidatorUtil.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

struct InputValidatorUtil {
  /// Check whether the provided string is a valid Email address or not.
  static func isValidEmail(_ email: String) -> Bool {
    let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
    return predicate.evaluate(with: email)
  }

  static func isValidFirstName(_ firstName: String) -> Bool {
    return !firstName.isEmpty
  }

  static func isValidLastName(_ lastName: String) -> Bool {
    return !lastName.isEmpty
  }

  static func isValidPassword(
    _ password: String,
    minLength: Int,
    maxLenth: Int
  ) -> Bool {
    let regEx = "^.{\(minLength),\(maxLenth)}$"
    let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
    return predicate.evaluate(with: password)
  }
}
