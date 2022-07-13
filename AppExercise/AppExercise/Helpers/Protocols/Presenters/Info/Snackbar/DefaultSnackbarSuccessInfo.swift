//
//  DefaultSnackbarSuccessInfo.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation
import UIKit

struct DefaultSnackbarSuccessInfo: InfoProtocol {
  let message: String
}

extension DefaultSnackbarSuccessInfo {
  var foregroundColor: UIColor { T.component.snackbar.success.foregroundColor }
  var backgroundColor: UIColor { T.component.snackbar.success.backgroundColor }
  var action: InfoAction? { .snackbarDismiss }
}
