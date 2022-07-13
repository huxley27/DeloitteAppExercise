//
//  PhoneCheckerViewModel.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

class PhoneCheckerViewModel: PhoneCheckerViewModelProtocol {
  let initialCountryCode: String
  let initialPhoneNumber: String

  private let usernameChecker: UsernameCheckerServiceProtocol

  init(
    initialCountryCode: String = "",
    initialPhoneNumber: String = "",
    usernameChecker: UsernameCheckerServiceProtocol = App.shared.usernameChecker
  ) {
    self.initialCountryCode = initialCountryCode
    self.initialPhoneNumber = initialPhoneNumber
    self.usernameChecker = usernameChecker
  }
}

// MARK: - Methods

extension PhoneCheckerViewModel {
  func checkPhoneNumberAvailability(
    countryCode: String,
    phoneNumber: String?,
    onAvailable: @escaping SingleResult<OTPAuthViewModelProtocol>,
    onUnavailable: @escaping SingleResult<OTPAuthViewModelProtocol>,
    onError: @escaping ErrorResult
  ) {
    let result = validate(phoneNumber)
    switch result {
    case let .success(phoneNumber):
      let fullPhoneNumber = countryCode + phoneNumber
      usernameChecker.checkUsernameAvailability(
        fullPhoneNumber,
        onAvailable: handleAvailable(
          with: fullPhoneNumber,
          thenExecute: onAvailable
        ),
        onUnavailable: handleUnavailable(
          with: fullPhoneNumber,
          thenExecute: onUnavailable
        ),
        onError: onError
      )
    case let .failure(error):
      onError(error)
    }
  }
}

// MARK: - Utils

private extension PhoneCheckerViewModel {
  func handleAvailable(
    with fullPhoneNumber: String,
    thenExecute handler: @escaping SingleResult<OTPAuthViewModelProtocol>
  ) -> VoidResult {
    return {
      let vm = OTPSignupViewModel(fullPhoneNumber: fullPhoneNumber)
      handler(vm)
    }
  }

  func handleUnavailable(
    with fullPhoneNumber: String,
    thenExecute handler: @escaping SingleResult<OTPAuthViewModelProtocol>
  ) -> VoidResult {
    return {
      let vm = OTPLoginViewModel(fullPhoneNumber: fullPhoneNumber)
      handler(vm)
    }
  }
}
