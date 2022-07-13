//
//  NSMutableAttributedString+Utils.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2019 Huxley. All rights reserved.
//

import UIKit

extension NSMutableAttributedString {
  func attributedString(
    _ string: String?,
    attributes: [NSAttributedString.Key: Any]? = nil
  ) -> NSMutableAttributedString {
    guard
      let text = string,
      text.count > 0,
      let range = self.string.range(of: text)
    else { return self }

    let attrString = NSMutableAttributedString(attributedString: self)
    attrString.setAttributes(
      attributes,
      range: NSRange(range, in: text)
    )
    return attrString
  }

  func attributedString(
    _ string: String?,
    font: UIFont,
    foregroundColor: UIColor
  ) -> NSMutableAttributedString {
    return attributedString(
      string,
      attributes: [
        .foregroundColor: foregroundColor,
        .font: font
      ]
    )
  }
}
