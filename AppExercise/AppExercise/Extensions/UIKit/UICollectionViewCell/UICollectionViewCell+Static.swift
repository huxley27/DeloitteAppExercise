//
//  UICollectionViewCell+Static.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
  static var reuseIdentifier: String {
    String(describing: self)
  }
}
