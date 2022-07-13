//
//  UITableViewCell+Static.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
  static var reuseIdentifier: String {
    String(describing: self)
  }
}
