//
//  ErrorHandlingServiceProtocol.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

protocol ErrorHandlingServiceProtocol {
  var onUnauthorizedError: VoidResult? { get set }
  
  func processAPIError(_ apiError: APIClientError)
  
  func processError(_ error: Error)

  func processError(
    _ error: Error,
    info: [String: Any]?
  )
}
