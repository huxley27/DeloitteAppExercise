//
//  EmailCheckerController.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import UIKit

import IQKeyboardManagerSwift
import MaterialComponents.MaterialTextFields
import RxCocoa
import RxSwift
import SVProgressHUD

class EmailCheckerController: ScrollViewController {
  var viewModel: EmailCheckerViewModelProtocol!
  var singleFormInputVM: SingleFormInputViewModelProtocol! { viewModel }

  @IBOutlet private(set) var field: MDCTextField!
  @IBOutlet private(set) var continueButton: MDCButton!

  private(set) var fieldInputController: MDCTextInputControllerBase!
  
  override var shouldSetNavBarTransparent: Bool { true }
}

// MARK: - LifeCycle

extension EmailCheckerController {
  override func viewDidLoad() {
    super.viewDidLoad()

    setup()
    bind()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    navigationController?.setNavigationBarHidden(false, animated: animated)

    IQKeyboardManager.shared.shouldShowToolbarPlaceholder = false
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)

    progressPresenter.dismiss()

    IQKeyboardManager.shared.shouldShowToolbarPlaceholder = true

    view.endEditing(true)
  }
}

// MARK: - Setup

private extension EmailCheckerController {
  func setup() {
    setupEmailField()

    continueButton.applyStyle(.primary)
  }

  func setupEmailField() {
    field.applyAttribute(.email)
    field.placeholder = S.emailFieldPlaceholder()
    field.text = viewModel.initialEmail
    field.returnKeyType = .continue
    field.enablesReturnKeyAutomatically = true

    fieldInputController = MDCHelper.inputController(for: field)

    field.becomeFirstResponder()
  }
}

// MARK: - Bind

private extension EmailCheckerController {
  func bind() {
    bindField()
    bindContinueButton()
  }
}

// MARK: - Actions

private extension EmailCheckerController {
  @IBAction
  func continueButtonTapped(_ sender: AnyObject) {
    progressPresenter.presentIndefiniteProgress(from: self)
    viewModel.checkEmailAvailability(
      email: field.text,
      onAvailable: handleAvailable(),
      onUnavailable: handleUnavailable(),
      onError: handleError()
    )
  }
}

// MARK: - SingleFormInputControllerProtocol

extension EmailCheckerController: SingleFormInputControllerProtocol {}

// MARK: - UsernameCheckerControllerProtocol

extension EmailCheckerController: UsernameCheckerControllerProtocol {}
