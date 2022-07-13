//
//  AppIconImageView.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2021 Huxley. All rights reserved.
//

import Foundation
import UIKit

class AppIconImageView: ImageView {
  override func awakeFromNib() {
    super.awakeFromNib()
    onInit()
  }

  func onInit() {
    image = App.icon
  }
}
