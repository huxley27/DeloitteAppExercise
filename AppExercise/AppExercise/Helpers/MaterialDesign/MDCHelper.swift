//
//  MDCHelper.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import MaterialComponents.MaterialTextFields_ColorThemer
import MaterialComponents.MaterialTextFields_TypographyThemer
import UIKit

/// MaterialDesignComponents Helper class
///
/// Theming guidelines:
/// - https://material.io/design/components/text-fields.html#theming
///
class MDCHelper {
  static let shared = MDCHelper()

  let theme = MDCTheme()
}

// MARK: - Filled TextField Style

extension MDCHelper {
  static func inputController(for field: MDCTextField) -> MDCTextInputControllerFilled {
    let controller = APTextInputControllerFilled(textInput: field)
    controller.setup()
    controller.applyTheme(withScheme: MDCHelper.shared.theme.containerScheme)
    return controller
  }

  static func inputController(for field: MDCMultilineTextField) -> MDCTextInputControllerFilled {
    let controller = APTextInputControllerFilled(textInput: field)
    controller.setup()
    controller.applyTheme(withScheme: MDCHelper.shared.theme.containerScheme)
    return controller
  }
}

// MARK: - Underline TextField Style

extension MDCHelper {
  static func underlineInputController(for field: MDCTextField) -> MDCTextInputControllerUnderline {
    let controller = MDCTextInputControllerUnderline(textInput: field)

    controller.isFloatingEnabled = true
    controller.underlineHeightNormal = 1
    controller.underlineHeightActive = 2

    controller.applyTheme(withScheme: MDCHelper.shared.theme.containerScheme)

    // This is because the new theming doesn't apply this to the Underline Textfields anymore
    // as it's already being deprecated.
    field.font = MDCHelper.shared.theme.typographyScheme.subtitle1
    
    field.leadingUnderlineLabel.numberOfLines = 0
    field.leadingUnderlineLabel.lineBreakMode = .byWordWrapping

    return controller
  }

  static func underlineInputController(for field: MDCMultilineTextField) -> MDCTextInputControllerUnderline {
    let controller = MDCTextInputControllerUnderline(textInput: field)

    controller.isFloatingEnabled = true

    controller.applyTheme(withScheme: MDCHelper.shared.theme.containerScheme)

    return controller
  }
}
