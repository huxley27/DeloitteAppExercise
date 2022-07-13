//
//  SingleFormInputViewModelProtocol.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

protocol SingleFormInputViewModelProtocol: AnyObject {
  func validate(_ input: String?) -> Result<String, Error>
}

// MARK: - Defaults

extension SingleFormInputViewModelProtocol {
  func validate(_ input: String?) -> Result<String, Error> {
    return .success("")
  }
}
