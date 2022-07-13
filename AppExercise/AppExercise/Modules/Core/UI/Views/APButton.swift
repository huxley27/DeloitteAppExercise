//
//  APButton.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2021 Huxley. All rights reserved.
//

import Foundation
import UIKit

import MaterialComponents.MDCButton

@IBDesignable
class APButton: MDCButton {
  var buttonStyle: MDCButtonStyleType { .primary }

  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }

  override func prepareForInterfaceBuilder() {
    setup()
  }

  private func setup() {
    applyStyle(buttonStyle)
  }
}

// MARK: - APCustomButton

class APCustomButton: APButton {
  @IBInspectable
  var foregroundColor: UIColor = R.color.textOnLightRegular()! {
    didSet { didSetTitleColor() }
  }

  @IBInspectable
  var backgroundColour: UIColor = R.color.primaryFull()! {
    didSet { didSetBackgroundColor() }
  }

  @IBInspectable
  var rippleColor: UIColor = R.color.textOnLightRegular()! {
    didSet { didSetRipple() }
  }

  @IBInspectable
  var rippleColorOpacity: CGFloat = 0.1 {
    didSet { didSetRipple() }
  }

  @IBInspectable
  var outlineColor: UIColor? = nil {
    didSet { didSetOutline() }
  }

  @IBInspectable
  var outlineThickness: CGFloat = 0 {
    didSet { didSetOutline() }
  }

  override var buttonStyle: MDCButtonStyleType { .textButton }

  override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    didSetTitleColor()
    didSetBackgroundColor()
    didSetRipple()
    didSetOutline()
  }

  private func didSetTitleColor() {
    setTitleColor(foregroundColor, for: .normal)
  }

  private func didSetBackgroundColor() {
    setBackgroundColor(backgroundColour, for: .normal)
  }

  private func didSetRipple() {
    inkColor = rippleColor.withAlphaComponent(rippleColorOpacity)
  }

  private func didSetOutline() {
    let thickness = (outlineColor != nil) ? outlineThickness : 0
    setBorderWidth(thickness, for: .normal)
    setBorderColor(outlineColor, for: .normal)
  }
}

// MARK: - APButtonPrimary

class APButtonPrimary: APButton {}

// MARK: - APButtonSecondary

class APButtonSecondary: APButton {
  override var buttonStyle: MDCButtonStyleType { .secondary }
}

// MARK: - APButtonOutlined

class APButtonOutlined: APButton {
  override var buttonStyle: MDCButtonStyleType { .outlined }
}

// MARK: - APButtonText

class APButtonText: APButton {
  @IBInspectable
  var textColor: UIColor = R.color.primaryFull()! {
    didSet { didSetTitleColor() }
  }

  override var buttonStyle: MDCButtonStyleType { .textButton }

  override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    didSetTitleColor()
  }

  private func didSetTitleColor() {
    setTitleColor(textColor, for: .normal)
  }
}

// MARK: - APButtonBottomFull

class APButtonBottomFull: APButton {
  override var buttonStyle: MDCButtonStyleType { .bottomFull }
}
