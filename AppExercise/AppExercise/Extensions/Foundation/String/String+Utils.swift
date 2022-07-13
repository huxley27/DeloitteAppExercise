//
//  String+Utils.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2019 Huxley. All rights reserved.
//

import UIKit

extension String {
  var trimmed: String { trimmingCharacters(in: .whitespacesAndNewlines) }

  func attributedString(_ attributes: [NSAttributedString.Key: Any]? = nil) -> NSMutableAttributedString {
    return NSMutableAttributedString(string: self, attributes: attributes)
  }

  func attributedString(_ font: UIFont, foregroundColor: UIColor) -> NSMutableAttributedString {
    return attributedString([
      .foregroundColor: foregroundColor,
      .font: font
    ])
  }
}

extension String {
  var isNumber: Bool {
    !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
  }

  var isAlphanumeric: Bool {
    !isEmpty && rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) == nil
  }
}
