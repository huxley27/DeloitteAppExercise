//
//  Control.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import UIKit

class Control: UIControl {
  override init(frame: CGRect) {
    super.init(frame: frame)
    prepare()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)

    // Do not call `prepare` method yet. Wait until the view is
    // completely loaded from a nib archive.
  }

  override func awakeFromNib() {
    super.awakeFromNib()
    prepare()
  }

  /// Called after the view is initialized or loaded from a nib archive.
  ///
  /// Subclasses can override this method to provide their own implementation. Don't forget to
  /// call super somewhere in the function.
  func prepare() {
    // Do additional setups here.
  }
}
