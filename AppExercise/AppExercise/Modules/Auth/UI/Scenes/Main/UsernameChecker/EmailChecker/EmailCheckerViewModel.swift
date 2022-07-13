//
//  EmailCheckerViewModel.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

class EmailCheckerViewModel: EmailCheckerViewModelProtocol {
  let initialEmail: String

  private let usernameChecker: UsernameCheckerServiceProtocol

  init(
    initialEmail: String = "",
    usernameChecker: UsernameCheckerServiceProtocol = App.shared.usernameChecker
  ) {
    self.initialEmail = initialEmail
    self.usernameChecker = usernameChecker
  }
}

// MARK: - Methods

extension EmailCheckerViewModel {
  func checkEmailAvailability(
    email: String?,
    onAvailable: @escaping SingleResult<CreatePasswordViewModelProtocol>,
    onUnavailable: @escaping SingleResult<LoginFormViewModelProtocol>,
    onError: @escaping ErrorResult
  ) {
    let result = validate(email)
    switch result {
    case let .success(email):
      usernameChecker.checkUsernameAvailability(
        email,
        onAvailable: handleAvailable(
          with: email,
          thenExecute: onAvailable
        ),
        onUnavailable: handleUnavailable(
          with: email,
          thenExecute: onUnavailable
        ),
        onError: onError
      )
    case let .failure(error):
      onError(error)
    }
  }
}

// MARK: - Util Handlers

private extension EmailCheckerViewModel {
  func handleAvailable(
    with email: String,
    thenExecute handler: @escaping SingleResult<CreatePasswordViewModelProtocol>
  ) -> VoidResult {
    return {
      let vm = EmailCreatePasswordViewModel(email: email)
      handler(vm)
    }
  }

  func handleUnavailable(
    with email: String,
    thenExecute handler: @escaping SingleResult<LoginFormViewModelProtocol>
  ) -> VoidResult {
    return {
      let vm = EmailLoginFormViewModel(email: email)
      handler(vm)
    }
  }
}
