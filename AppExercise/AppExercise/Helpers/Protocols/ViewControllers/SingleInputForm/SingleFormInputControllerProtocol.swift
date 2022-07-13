//
//  SingleFormInputControllerProtocol.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation
import UIKit

import MaterialComponents.MaterialTextFields
import RxSwift
import SVProgressHUD

protocol SingleFormInputControllerProtocol where Self: ViewController {
  var singleFormInputVM: SingleFormInputViewModelProtocol! { get }

  var field: MDCTextField! { get }
  var fieldInputController: MDCTextInputControllerBase! { get }
  var continueButton: MDCButton! { get }

  func bindField()
  func bindContinueButton()

  func handleSuccess() -> VoidResult
  func handleError() -> ErrorResult

  func resetForm()
}

// MARK: - Bind

extension SingleFormInputControllerProtocol {
  func bindField() {
    field.rx.controlEvent(.editingDidEndOnExit)
      .withLatestFrom(field.rx.text)
      .filter { !$0.isNilOrEmpty }
      .bind(onNext: handleReturnKeyTap())
      .disposed(by: rx.disposeBag)
  }

  func bindContinueButton() {
    field.rx.text.orEmpty
      .withLatestFrom(
        Observable.just(singleFormInputVM),
        resultSelector: { $1?.validate($0) }
      )
      .compactMap { $0?.isSuccess }
      .bind(to: continueButton.rx.isEnabled)
      .disposed(by: rx.disposeBag)
  }
}

// MARK: - Handlers

extension SingleFormInputControllerProtocol {
  func handleReturnKeyTap<T>() -> SingleResult<T> {
    return { [weak self] _ in
      guard let self = self else { return }
      self.continueButton.sendActions(for: .touchUpInside)
    }
  }

  func handleSuccess() -> VoidResult {
    return { [weak self] in
      guard let self = self else { return }
      self.resetForm()
    }
  }

  func handleError() -> ErrorResult {
    return { [weak self] error in
      guard let self = self else { return }
      self.progressPresenter.dismiss()
      self.infoPresenter.presentErrorInfo(error: error)
    }
  }
}

// MARK: - Utils

extension SingleFormInputControllerProtocol {
  func resetForm() {
    progressPresenter.dismiss()
    fieldInputController.setErrorText(nil, errorAccessibilityValue: nil)
  }
}
