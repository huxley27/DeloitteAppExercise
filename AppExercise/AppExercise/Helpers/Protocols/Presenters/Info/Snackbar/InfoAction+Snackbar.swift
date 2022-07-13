//
//  InfoAction+Snackbar.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

import MaterialComponents.MaterialSnackbar

extension InfoAction {
  private static let dismiss: VoidResult = {
    MDCSnackbarManager.dismissAndCallCompletionBlocks(withCategory: nil)
  }

  static var snackbarDismiss: InfoAction { .init(title: S.hide(), onSelect: dismiss) }
}
