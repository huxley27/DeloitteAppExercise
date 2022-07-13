//
//  MDCButton+Stylable.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import MaterialComponents
import UIKit

extension MDCButton: Styleable {
  func applyStyle(_ style: MDCButtonStyleType) {
    style.apply(to: self)
  }
}

enum MDCButtonStyleType: ViewStyleType {
  case primary
  case secondary
  case outlined
  case textButton
  case bottomFull

  case white
  case black

  case base
  case baseWithShadow

  func apply(to button: MDCButton) {
    switch self {
    case .primary: applyPrimaryStyle(to: button)
    case .secondary: applySecondaryStyle(to: button)
    case .outlined: applyOutlinedStyle(to: button)
    case .textButton: applyTextButtonStyle(to: button)
    case .bottomFull: applyBottomFullStyle(to: button)

    case .white: applyWhiteStyle(to: button)
    case .black: applyBlackStyle(to: button)

    case .base: applyBaseStyle(to: button)
    case .baseWithShadow: applyBaseWithShadowStyle(to: button)
    }
  }
}

// MARK: - Helpers

private extension MDCButtonStyleType {
  func applyBaseStyle(
    to button: MDCButton,
    cornerRadius: CGFloat = T.dimens.cornerRadius.button
  ) {
    button.layer.cornerRadius = cornerRadius
    button.setTitleFont(T.textStyle.form.button, for: .normal)
    button.isUppercaseTitle = false

    button.disabledAlpha = 1
  }

  func applyDisabledStateStyle(
    to button: MDCButton,
    foregroundColor: UIColor = R.color.textOnPrimaryRegular()!,
    backgroundColor: UIColor = R.color.greysInactive()!
  ) {
    button.setTitleColor(foregroundColor, for: .disabled)
    button.setBackgroundColor(backgroundColor, for: .disabled)
  }

  func applySolidStyle(
    to button: MDCButton,
    foregroundColor: UIColor = R.color.textOnPrimaryRegular()!,
    backgroundColor: UIColor = R.color.primaryFull()!,
    cornerRadius: CGFloat = T.dimens.cornerRadius.button
  ) {
    applyBaseStyle(
      to: button,
      cornerRadius: cornerRadius
    )

    button.setTitleColor(foregroundColor, for: .normal)
    button.setBackgroundColor(backgroundColor, for: .normal)

    applyDisabledStateStyle(to: button)
  }

  func applyShadow(to button: MDCButton) {
    button.applyShadow(
      // TODO: Review this, we don't have standard for shadows yet
      color: R.color.greysInactive()!,
      opacity: 0.1,
      offSet: CGSize(width: 0, height: 2),
      radius: 6
    )
  }
}

// MARK: - Styles

private extension MDCButtonStyleType {
  func applyPrimaryStyle(to button: MDCButton) {
    applySolidStyle(to: button)
  }

  func applySecondaryStyle(to button: MDCButton) {
    applySolidStyle(
      to: button,
      backgroundColor: R.color.secondaryFull()!
    )
  }

  func applyOutlinedStyle(
    to button: MDCButton,
    borderColor: UIColor = R.color.primaryFull()!,
    foregroundColor: UIColor = R.color.primaryFull()!,
    backgroundColor: UIColor? = .none
  ) {
    applyBaseStyle(to: button)

    button.setTitleColor(foregroundColor, for: .normal)
    button.setBackgroundColor(backgroundColor, for: .normal)
    button.setBorderWidth(2, for: .normal)
    button.setBorderColor(borderColor, for: .normal)
    button.inkColor = foregroundColor.withAlphaComponent(0.1)

    applyDisabledStateStyle(to: button)
    button.setBorderWidth(0, for: .disabled)
  }

  func applyTextButtonStyle(
    to button: MDCButton,
    foregroundColor: UIColor = R.color.primaryFull()!,
    backgroundColor: UIColor? = .none
  ) {
    applyBaseStyle(to: button)

    button.setTitleColor(foregroundColor, for: .normal)
    button.setBackgroundColor(backgroundColor, for: .normal)

    applyDisabledStateStyle(to: button)

    button.inkColor = foregroundColor.withAlphaComponent(0.1)
  }

  func applyBottomFullStyle(
    to button: MDCButton,
    foregroundColor: UIColor = R.color.textOnPrimaryRegular()!,
    backgroundColor: UIColor = R.color.primaryFull()!
  ) {
    applySolidStyle(
      to: button,
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
      cornerRadius: 0
    )
  }

  //
  // TODO: Review styles below. Might be too specific, since it's only used for social sign.in buttons
  //
  func applyBlackStyle(to button: MDCButton) {
    applyBaseStyle(to: button)
    button.setBackgroundColor(R.color.backgroundDark()!)
    button.setTitleColor(R.color.textOnDarkRegular()!, for: .normal)
    applyDisabledStateStyle(to: button)
  }

  func applyWhiteStyle(to button: MDCButton) {
    button.applyOutlinedTheme(withScheme: MDCHelper.shared.theme.containerScheme)
    button.setTitleColor(R.color.primaryFull()!, for: .normal)
    button.setBackgroundColor(R.color.backgroundLight()!)

    applyBaseWithShadowStyle(to: button)
    applyDisabledStateStyle(to: button)
  }

  func applyBaseWithShadowStyle(to button: MDCButton) {
    applyBaseStyle(to: button)
    applyShadow(to: button)
  }
}
