//
//  UIFont+Utils.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2019 Huxley. All rights reserved.
//

import UIKit

extension UIFont {
  static func printFamilyNames() {
    for family in UIFont.familyNames.sorted() {
      let names = UIFont.fontNames(forFamilyName: family)
      debugLog("Family: \(family) Font names: \(names)")
    }
  }
}

// MARK: Semantic font

extension UIFont {
  static var largeTitle: UIFont {
    .boldSystemFont(ofSize: 32)
  }

  static var title1: UIFont {
    .systemFont(ofSize: 28)
  }

  static var title2: UIFont {
    .systemFont(ofSize: 22)
  }

  static var title3: UIFont {
    .systemFont(ofSize: 20)
  }

  static var headline: UIFont {
    // TODO: This should be semibold
    .systemFont(ofSize: 17)
  }

  static var body: UIFont {
    .systemFont(ofSize: 17)
  }

  static var callout: UIFont {
    .systemFont(ofSize: 16)
  }

  static var subhead: UIFont {
    .systemFont(ofSize: 15)
  }

  static var footnote: UIFont {
    .systemFont(ofSize: 13)
  }

  static var caption1: UIFont {
    .systemFont(ofSize: 12)
  }

  static var caption2: UIFont {
    .systemFont(ofSize: 11)
  }
}
