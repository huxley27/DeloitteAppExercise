//
//  PhoneCheckerViewModelProtocol.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

protocol PhoneCheckerViewModelProtocol: SingleFormInputViewModelProtocol {
  var initialCountryCode: String { get }
  var initialPhoneNumber: String { get }

  func checkPhoneNumberAvailability(
    countryCode: String,
    phoneNumber: String?,
    onAvailable: @escaping SingleResult<OTPAuthViewModelProtocol>,
    onUnavailable: @escaping SingleResult<OTPAuthViewModelProtocol>,
    onError: @escaping ErrorResult
  )
}

// MARK: - SingleFormInputViewModelProtocol

extension PhoneCheckerViewModelProtocol {
  func validate(_ input: String?) -> Result<String, Error> {
    return PhoneNumberInputValidator.validate(input).genericResult
  }
}
