//
//  ProgressPresenterProtocol.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation
import UIKit

protocol ProgressPresenterProtocol {
  func presentProgress(
    value: Float,
    from source: UIViewController
  )

  func presentProgress(
    value: Float,
    message: String?,
    from source: UIViewController
  )

  func dismiss()

  func dismiss(
    onComplete: @escaping VoidResult
  )
}
