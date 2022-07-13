//
//  EmailCheckerViewModelProtocol.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

protocol EmailCheckerViewModelProtocol: SingleFormInputViewModelProtocol {
  var initialEmail: String { get }
  
  func checkEmailAvailability(
    email: String?,
    onAvailable: @escaping SingleResult<CreatePasswordViewModelProtocol>,
    onUnavailable: @escaping SingleResult<LoginFormViewModelProtocol>,
    onError: @escaping ErrorResult
  )
}

// MARK: - SingleFormInputViewModelProtocol

extension EmailCheckerViewModelProtocol {
  func validate(_ input: String?) -> Result<String, Error> {
    return EmailAddressInputValidator.validate(input).genericResult
  }
}
