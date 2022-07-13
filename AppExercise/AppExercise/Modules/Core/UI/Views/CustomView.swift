//
//  CustomView.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import UIKit

@IBDesignable
class CustomView: BaseView {
  @IBInspectable var cornerRadius: CGFloat = 0 {
    didSet {
      layer.cornerRadius = cornerRadius
    }
  }

  // Note: Used `borderColour` as getter/setter for 'borderColor'
  // with Objective-C selector 'borderColor' conflicts
  // with getter/setter for 'borderColor'
  @IBInspectable var borderColour: UIColor = .clear {
    didSet {
      layer.borderColor = borderColour.cgColor
    }
  }

  @IBInspectable var borderWidth: CGFloat = 0 {
    didSet {
      layer.borderWidth = borderWidth
    }
  }

  // Note: Used `borderColour` in relation to `borderColour` spelling
  @IBInspectable var layerShadowColour: UIColor = .clear {
    didSet {
      layer.shadowColor = layerShadowColour.cgColor
    }
  }

  @IBInspectable var layerShadowRadius: CGFloat = 0 {
    didSet {
      layer.shadowRadius = layerShadowRadius
    }
  }

  @IBInspectable var layerShadowOpacity: Float = 0 {
    didSet {
      layer.shadowOpacity = layerShadowOpacity
    }
  }

  @IBInspectable var layerShadowOffset: CGSize = .zero {
    didSet {
      layer.shadowOffset = layerShadowOffset
    }
  }
}
