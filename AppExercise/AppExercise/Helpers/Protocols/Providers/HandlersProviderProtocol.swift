//
//  HandlersProviderProtocol.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation
import UIKit

protocol HandlersProviderProtocol where Self: UIViewController {
  func handleSuccess(
    then onComplete: VoidResult?
  ) -> VoidResult

  func handleSuccessWithMessage(
    then onComplete: SingleResult<String>?
  ) -> SingleResult<String>

  func handleProgress() -> SingleResult<Progress>

  func handleError(
    then onComplete: ErrorResult?
  ) -> ErrorResult

  func handleTextFieldError(
    in textField: APTextFieldProtocol
  ) -> ErrorResult

  func handleErrorByShowing(
    in label: UILabel
  ) -> ErrorResult
}

// MARK: - Defaults

extension HandlersProviderProtocol where Self: PresentersProviderProtocol {
  func handleSuccess(
    then onComplete: VoidResult? = nil
  ) -> VoidResult {
    return { [weak self] in
      guard let self = self else { return }
      self.progressPresenter.dismiss()
      onComplete?()
    }
  }

  func handleSuccessWithMessage(
    then onComplete: SingleResult<String>? = nil
  ) -> SingleResult<String> {
    return { [weak self] message in
      guard let self = self else { return }
      self.progressPresenter.dismiss()
      self.infoPresenter.presentSuccessInfo(message: message)
      onComplete?(message)
    }
  }

  func handleProgress() -> SingleResult<Progress> {
    return { [weak self] progress in
      guard let self = self else { return }
      self.progressPresenter.presentProgress(
        value: Float(progress.fractionCompleted),
        from: self
      )
    }
  }

  func handleError(
    then onComplete: ErrorResult? = nil
  ) -> ErrorResult {
    return { [weak self] error in
      guard let self = self else { return }
      self.progressPresenter.dismiss()
      self.infoPresenter.presentErrorInfo(error: error)
      onComplete?(error)
    }
  }

  func handleTextFieldError(in textField: APTextFieldProtocol) -> ErrorResult {
    return { [textField] error in
      textField.setErrorText(error.localizedDescription)
    }
  }

  func handleErrorByShowing(in label: UILabel) -> ErrorResult {
    return { [label] error in
      label.isHidden = false
      label.text = error.localizedDescription
    }
  }
}
