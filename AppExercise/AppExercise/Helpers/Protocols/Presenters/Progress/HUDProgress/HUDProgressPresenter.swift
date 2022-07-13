//
//  HUDProgressPresenter.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

import SVProgressHUD

class HUDProgressPresenter: ProgressPresenterProtocol {
  func presentProgress(
    value: Float,
    from source: UIViewController
  ) {
    presentProgress(
      value: value,
      message: nil,
      from: source
    )
  }

  func presentProgress(
    value: Float,
    message: String?,
    from source: UIViewController
  ) {
    SVProgressHUD.showProgress(
      Float(value),
      status: message
    )
  }

  func dismiss() {
    dismiss(onComplete: DefaultClosure.voidResult())
  }

  func dismiss(
    onComplete: @escaping VoidResult
  ) {
    SVProgressHUD.dismiss(completion: onComplete)
  }
}
