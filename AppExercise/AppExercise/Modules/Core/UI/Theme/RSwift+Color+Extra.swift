//
//  RSwift+Color+Extra.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2021 Huxley. All rights reserved.
//

// swiftlint:disable type_name

import UIKit

extension R.color {
  enum form {}
}

// MARK: - Form

extension R.color.form {
  enum textField {
    static func placeholderTextColor() -> UIColor? { R.color.greysInactive() }
    static func textColor() -> UIColor? { R.color.textOnLightRegular() }
  }
}
