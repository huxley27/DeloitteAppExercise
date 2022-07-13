//
//  UIAlertAction+Static.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertAction {
  static func cancelAction(with title: String = S.cancel()) -> UIAlertAction {
    UIAlertAction(
      title: title,
      style: .cancel
    )
  }
}
