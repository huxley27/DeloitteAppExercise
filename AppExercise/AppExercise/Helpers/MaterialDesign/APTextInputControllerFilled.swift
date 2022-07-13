//
//  APTextInputControllerFilled.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com ).
//  Copyright © 2021 Huxley. All rights reserved.
//

import Foundation

import MaterialComponents.MDCTextInputController

class APTextInputControllerFilled: MDCTextInputControllerFilled {
  var cornerRadius: CGFloat = 8

  private var kvo: [NSKeyValueObservation] = []
  private var isLastBorderPathChangeOurs = false

  func setup() {
    underlineHeightNormal = 0
    underlineHeightActive = 0
    inlinePlaceholderColor = R.color.form.textField.placeholderTextColor()!
    floatingPlaceholderNormalColor = .black
    roundedCorners = .allCorners

    // This prevents underline from showing up when textInput is disabled.
    textInput?.underline?.isHidden = true

    guard
      let field = textInput as? MDCTextField,
      field.frame.height > 0
    else { return }
    kvo.append(
      field.observe(
        \.borderPath,
        changeHandler: { [weak self] _, _ in
          guard let self = self else { return }

          if !self.isLastBorderPathChangeOurs {
            self.updateBorder()
          }

          self.isLastBorderPathChangeOurs = false
        }
      )
    )
  }

  private func updateBorder() {
    isLastBorderPathChangeOurs = true
    textInput?.borderPath = customBorderPath()
  }

  private func customBorderPath() -> UIBezierPath {
    var borderBound = textInput?.bounds ?? .zero
    borderBound.size.height = textInput?.underline?.frame.maxY ?? 0
    return UIBezierPath(
      roundedRect: borderBound,
      byRoundingCorners: roundedCorners,
      cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)
    )
  }
  
  override func applyTheme(withScheme scheme: MDCContainerScheming) {
    super.applyTheme(withScheme: scheme)
    textInput?.font = scheme.typographyScheme.subtitle1
    textInput?.placeholderLabel.font = scheme.typographyScheme.caption
  }
}
