//
//  MDCTheme.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2021 Huxley. All rights reserved.
//

import Foundation
import UIKit

import MaterialComponents.MaterialTextFields_ColorThemer
import MaterialComponents.MaterialTextFields_TypographyThemer

struct MDCTheme {
  let typographyScheme = MDCTypographyScheme()
  let colorScheme = MDCSemanticColorScheme()
  let containerScheme = MDCContainerScheme()

  init() {
    setupTypographyScheme()
    setupColorScheme()

    setupContainerScheme()
  }
}

// MARK: - Setup

private extension MDCTheme {
  func setupTypographyScheme() {
    typographyScheme.headline1 = T.textStyle.largeTitle
    typographyScheme.subtitle1 = T.textStyle.subHeadline
    typographyScheme.caption = T.textStyle.caption
  }

  func setupColorScheme() {
    colorScheme.primaryColor = R.color.primaryFull()!
    colorScheme.errorColor = R.color.alertError()!
  }

  func setupContainerScheme() {
    containerScheme.typographyScheme = typographyScheme
    containerScheme.colorScheme = colorScheme
  }
}
