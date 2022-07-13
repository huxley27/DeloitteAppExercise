//
//  UIView+Responder.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import UIKit

extension UIView {
  var firstResponder: UIView? {
    guard !isFirstResponder else { return self }

    for subview in subviews {
      if let firstResponder = subview.firstResponder {
        return firstResponder
      }
    }

    return nil
  }
}
