//
//  Theme+TextStyle.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2021 Huxley. All rights reserved.
//

// swiftlint:disable type_name

import UIKit

extension Theme.textStyle {
  static let largeTitle: UIFont = T.font.boldSecondary(ofSize: 34)
  static let title1: UIFont = T.font.boldSecondary(ofSize: 28)
  static let title2: UIFont = T.font.boldSecondary(ofSize: 22)
  static let title3: UIFont = T.font.semiBoldSecondary(ofSize: 18)
  static let headline: UIFont = T.font.semibold(ofSize: 17)
  static let body: UIFont = T.font.regular(ofSize: 17)
  static let bodyMedium: UIFont = T.font.medium(ofSize: 17)
  static let callout: UIFont = T.font.regular(ofSize: 16)
  static let subHeadline: UIFont = T.font.regular(ofSize: 15)
  static let subHeadlineMedium: UIFont = T.font.regular(ofSize: 15)
  static let footnote: UIFont = T.font.regular(ofSize: 13)
  static let caption: UIFont = T.font.regular(ofSize: 11)
  static let captionSemibold: UIFont = T.font.semibold(ofSize: 11)

  struct form {}
}

// MARK: - Form

extension Theme.textStyle.form {
  static let button: UIFont = T.font.semibold(ofSize: 17)
  static let textField: UIFont = T.font.regular(ofSize: 17)
}
