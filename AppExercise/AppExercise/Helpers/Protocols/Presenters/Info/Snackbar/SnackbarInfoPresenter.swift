//
//  SnackbarInfoPresenter.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation
import UIKit

import MaterialComponents.MaterialSnackbar

class SnackbarInfoPresenter: InfoPresenterProtocol {
  func presentInfo(
    _ info: InfoProtocol,
    onComplete: @escaping VoidResult
  ) {
    let message = MDCSnackbarMessage()

    MDCSnackbarManager.snackbarMessageViewBackgroundColor = info.backgroundColor
    MDCSnackbarManager.messageTextColor = info.foregroundColor

    message.text = info.message
    message.duration = info.duration

    if let action = info.action {
      let sbAction = MDCSnackbarMessageAction()
      sbAction.handler = action.onSelect
      sbAction.title = action.title
      message.action = sbAction
    }
    MDCSnackbarManager.show(message)
  }

  func presentSuccessInfo(message: String) {
    presentSuccessInfo(
      message: message,
      onComplete: DefaultClosure.voidResult()
    )
  }

  func presentSuccessInfo(
    message: String,
    onComplete: @escaping VoidResult
  ) {
    let info = DefaultSnackbarSuccessInfo(message: message)
    presentInfo(info, onComplete: onComplete)
  }

  func presentErrorInfo(error: Error) {
    presentErrorInfo(
      error: error,
      onComplete: DefaultClosure.voidResult()
    )
  }

  func presentErrorMessage(message: String) {
    let info = DefaultSnackbarErrorInfo(errorMessage: message)
    presentInfo(info, onComplete: DefaultClosure.voidResult())
  }

  func presentErrorInfo(
    error: Error,
    onComplete: @escaping VoidResult
  ) {
    let info = DefaultSnackbarErrorInfo(error: error)
    presentInfo(info, onComplete: onComplete)
  }
}
