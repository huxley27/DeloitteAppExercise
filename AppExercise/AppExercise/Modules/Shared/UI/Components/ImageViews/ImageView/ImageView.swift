//
//  ImageView.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2019 Huxley. All rights reserved.
//

import UIKit

@IBDesignable
class ImageView: UIImageView {
  @IBInspectable var borderColour: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3153360445) {
    didSet {
      layer.borderColor = borderColour.cgColor
    }
  }

  @IBInspectable var borderWidth: CGFloat = 0 {
    didSet {
      layer.borderWidth = borderWidth
    }
  }

  @IBInspectable var cornerRadius: CGFloat = 0 {
    didSet {
      layer.cornerRadius = cornerRadius
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    afterInit()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override func awakeFromNib() {
    super.awakeFromNib()
    afterInit()
  }

  func afterInit() {
    // noop
  }
}
