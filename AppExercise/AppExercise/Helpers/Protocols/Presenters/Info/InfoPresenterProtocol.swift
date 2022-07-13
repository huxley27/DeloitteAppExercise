//
//  InfoPresenterProtocol.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation
import UIKit

protocol InfoPresenterProtocol {
  func presentInfo(
    _ info: InfoProtocol,
    onComplete: @escaping VoidResult
  )

  func presentSuccessInfo(message: String)

  func presentSuccessInfo(
    message: String,
    onComplete: @escaping VoidResult
  )

  func presentErrorInfo(error: Error)

  func presentErrorMessage(message: String)

  func presentErrorInfo(
    error: Error,
    onComplete: @escaping VoidResult
  )
}
