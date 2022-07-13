//
//  Result+Validate.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

extension Result {
  var isSuccess: Bool {
    (try? get()) != nil
  }

  var genericResult: Result<Success, Error> {
    switch self {
    case let .success(validInput):
      return .success(validInput)
    case let .failure(error):
      return .failure(error)
    }
  }
}
