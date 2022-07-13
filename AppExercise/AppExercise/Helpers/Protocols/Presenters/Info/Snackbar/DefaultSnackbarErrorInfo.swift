//
//  DefaultSnackbarErrorInfo.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation
import UIKit

struct DefaultSnackbarErrorInfo: InfoProtocol {
  let errorMessage: String

  init(errorMessage: String) {
    self.errorMessage = errorMessage
  }

  init(error: Error) {
    self.init(errorMessage: error.localizedDescription)
  }
}

extension DefaultSnackbarErrorInfo {
  var message: String { errorMessage }
  var foregroundColor: UIColor { T.component.snackbar.error.foregroundColor }
  var backgroundColor: UIColor { T.component.snackbar.error.backgroundColor }
  var action: InfoAction? { .snackbarDismiss }
}
