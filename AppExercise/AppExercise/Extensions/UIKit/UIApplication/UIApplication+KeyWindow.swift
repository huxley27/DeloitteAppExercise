//
//  UIApplication+KeyWindow.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
  var multisceneKeyWindow: UIWindow? {
    windows.filter { $0.isKeyWindow }.first
  }
}
