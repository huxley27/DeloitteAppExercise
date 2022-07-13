//
//  UINavigationBar+Transparency.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationBar {
  func setTransparent() {
    setBackgroundImage(UIImage(), for: .default)
    shadowImage = UIImage()
    barTintColor = .clear
    isTranslucent = true
  }
  
  func setNonTransparent() {
    setBackgroundImage(nil, for: .default)
    shadowImage = nil
    barTintColor = .white
    isTranslucent = true
  }
}
