//
//  PhoneCheckerController.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

import IQKeyboardManagerSwift
import MaterialComponents.MaterialTextFields
import RxCocoa
import RxSwift
import SVProgressHUD

class PhoneCheckerController: ViewController {
  var viewModel: PhoneCheckerViewModelProtocol!
  var singleFormInputVM: SingleFormInputViewModelProtocol! { viewModel }

  @IBOutlet private(set) var scrollContentView: UIView!
  @IBOutlet private(set) var countryField: APCountryCodeField!

  @IBOutlet private(set) var field: MDCTextField!
  @IBOutlet private(set) var continueButton: MDCButton!

  private(set) var countryInputController: MDCTextInputControllerBase!
  private(set) var fieldInputController: MDCTextInputControllerBase!

  override var shouldSetNavBarTransparent: Bool { true }
}

// MARK: - LifeCycle

extension PhoneCheckerController {
  override func viewDidLoad() {
    super.viewDidLoad()

    setup()
    bind()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    navigationController?.setNavigationBarHidden(false, animated: animated)
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)

    IQKeyboardManager.shared.shouldShowToolbarPlaceholder = true
  }
}

// MARK: - Setup

private extension PhoneCheckerController {
  func setup() {
    setupCountryField()
    setupPhoneField()

    continueButton.applyStyle(.primary)
  }

  func setupCountryField() {
    countryInputController = MDCHelper.inputController(for: countryField)

    countryField.isUserInteractionEnabled = false
    countryField.pickerDelegate = self
  }

  func setupPhoneField() {
    field.applyAttribute(.phoneNumber)

    fieldInputController = MDCHelper.inputController(for: field)

    field.becomeFirstResponder()
  }
}

// MARK: - Bind

private extension PhoneCheckerController {
  func bind() {
    bindField()
    bindContinueButton()
  }
}

// MARK: - Actions

extension PhoneCheckerController {
  @IBAction
  func continueButtonTapped(_ sender: AnyObject) {
    guard let countryCode = countryField.text else {
      return debugPrint("countryField.text should not be nil at this point")
    }

    progressPresenter.presentIndefiniteProgress(from: self)
    viewModel.checkPhoneNumberAvailability(
      countryCode: countryCode,
      phoneNumber: field.text,
      onAvailable: handleResult(),
      onUnavailable: handleResult(),
      onError: handleError()
    )
  }
}

// MARK: - SingleFormInputControllerProtocol

extension PhoneCheckerController: SingleFormInputControllerProtocol {}

// MARK: - UsernameCheckerControllerProtocol

extension PhoneCheckerController: UsernameCheckerControllerProtocol {
  func handleResult() -> SingleResult<OTPAuthViewModelProtocol> {
    return { [weak self] otpAuthVM in
      guard let self = self else { return }
      self.progressPresenter.dismiss()
      self.clearFormErrors()
      self.presentOTPAuthPage(with: otpAuthVM)
    }
  }
}

// MARK: - Helpers

private extension PhoneCheckerController {
  func presentOTPAuthPage(with viewModel: OTPAuthViewModelProtocol) {
    let vc = R.storyboard.otpAuth.otpAuthController()!
    vc.viewModel = viewModel
    navigationController?.pushViewController(vc, animated: true)
  }
}
