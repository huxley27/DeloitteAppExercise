//
//  APTextField.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import MaterialComponents.MDCTextField
import UIKit

class APTextField: MDCTextField, APTextFieldProtocol {
  var inputController: MDCTextInputControllerBase?
  
  var isCutActionEnabled = true
  var isCopyActionEnabled = true
  var isPasteActionEnabled = true
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    prepare()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  override func awakeFromNib() {
    super.awakeFromNib()
    prepare()
  }

  func prepare() {
    // no-op
  }

  override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
    if action == #selector(cut(_:)) {
      return isCutActionEnabled
    } else if action == #selector(copy(_:)) {
      return isCopyActionEnabled
    } else if action == #selector(paste(_:)) {
      return isPasteActionEnabled
    }

    return super.canPerformAction(action, withSender: sender)
  }
}
