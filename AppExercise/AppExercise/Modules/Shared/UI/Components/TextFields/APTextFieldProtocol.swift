//
//  APTextFieldProtocol.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

import MaterialComponents.MDCTextField

protocol APTextFieldProtocol {
  var inputController: MDCTextInputControllerBase? { get set }

  func setErrorText(_ errorText: String?)
  
  func reset()
}

// MARK: - Defaults

extension APTextFieldProtocol {
  func setErrorText(_ errorText: String?) {
    inputController?.setErrorText(errorText, errorAccessibilityValue: nil)
  }
  
  func reset() {
    setErrorText(nil)
  }
}
