//
//  Theme+Font.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2021 Huxley. All rights reserved.
//

import UIKit

// MARK: - Primary
//
// Primary fonts are fonts that are most used by the app, usually on body text, forms, buttons, etc.

extension Theme.font {
  static func bold(ofSize size: CGFloat) -> UIFont {
    R.font.sfProTextBold(size: size)!
  }

  static func heavy(ofSize size: CGFloat) -> UIFont {
    .systemFont(ofSize: size, weight: .heavy)
  }

  static func light(ofSize size: CGFloat) -> UIFont {
    .systemFont(ofSize: size, weight: .light)
  }

  static func medium(ofSize size: CGFloat) -> UIFont {
    R.font.sfProTextMedium(size: size)!
  }

  static func regular(ofSize size: CGFloat) -> UIFont {
    R.font.sfProTextRegular(size: size)!
  }

  static func semibold(ofSize size: CGFloat) -> UIFont {
    R.font.sfProTextSemibold(size: size)!
  }

  static func thin(ofSize size: CGFloat) -> UIFont {
    .systemFont(ofSize: size, weight: .thin)
  }

  static func ultralight(ofSize size: CGFloat) -> UIFont {
    .systemFont(ofSize: size, weight: .ultraLight)
  }
}

// MARK: - Secondary
//
// Secondary fonts are fonts that have different typeface from your primary, usually applied to titles, headers, etc.

extension Theme.font {
  static func boldSecondary(ofSize size: CGFloat) -> UIFont {
    R.font.sfProDisplayBold(size: size)!
  }

  static func mediumSecondary(ofSize size: CGFloat) -> UIFont {
    R.font.sfProDisplayMedium(size: size)!
  }

  static func regularSecondary(ofSize size: CGFloat) -> UIFont {
    R.font.sfProDisplayRegular(size: size)!
  }

  static func semiBoldSecondary(ofSize size: CGFloat) -> UIFont {
    R.font.sfProDisplaySemibold(size: size)!
  }
}
