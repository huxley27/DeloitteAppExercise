//
//  AppDelegate+Appearance.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2019 Huxley. All rights reserved.
//

import MaterialComponents.MDCSnackbarManager
import SVProgressHUD
import UIKit

// All UIAppearance configurations should all go in here.

// MARK: - Appearance

extension AppDelegate {
  func loadAppearancePreferences() {
    loadNavBarAppearancePrefs()
    loadBarButtonItemAppearancePrefs()
    loadTableViewCellAppearancePrefs()

    applySVProgressHUDTheme()
    applyMDCSnackbarTheme()
  }

  private func loadNavBarAppearancePrefs() {
    let navBar = UINavigationBar.appearance(whenContainedInInstancesOf: [
      NavigationController.self
    ])

    navBar.barTintColor = T.component.navBar.barTintColor
    navBar.tintColor = T.component.navBar.tintColor
    navBar.titleTextAttributes = [
      NSAttributedString.Key.foregroundColor: T.component.navBar.tintColor as Any,
      NSAttributedString.Key.font: T.component.navBar.font as Any
    ]
  }

  private func loadBarButtonItemAppearancePrefs() {
    let barButton = UIBarButtonItem.appearance(whenContainedInInstancesOf: [
      UINavigationController.self
    ])
    barButton.setTitleTextAttributes(
      [
        NSAttributedString.Key.foregroundColor: T.component.loadBarButtonItem.foregroundColor,
        NSAttributedString.Key.font: T.component.loadBarButtonItem.font
      ],
      for: .normal
    )
  }

  private func loadTableViewCellAppearancePrefs() {
    /*
     let cell = UITableViewCell.appearance(whenContainedInInstancesOf: [...])
     cell.tintColor = ...
     */
  }
}

// MARK: - SVProgressHUD

private extension AppDelegate {
  func applySVProgressHUDTheme() {
    SVProgressHUD.setDefaultAnimationType(.native)
    SVProgressHUD.setMinimumSize(CGSize(width: 86, height: 86))

    SVProgressHUD.setDefaultStyle(.custom)
    SVProgressHUD.setBackgroundColor(T.component.progressHUD.backgroundColor)
    SVProgressHUD.setBackgroundLayerColor(T.component.progressHUD.backgroundLayerColor)
  }
}

// MARK: - MDCSnackbar

private extension AppDelegate {
  func applyMDCSnackbarTheme() {
    MDCSnackbarManager.messageFont = T.component.snackbar.font
    MDCSnackbarManager.messageTextColor = T.component.snackbar.foregroundColor
    MDCSnackbarManager.snackbarMessageViewBackgroundColor = T.component.snackbar.backgroundColor
  }
}
