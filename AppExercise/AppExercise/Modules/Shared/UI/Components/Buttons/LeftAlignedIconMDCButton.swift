//
//  LeftAlignedIconMDCButton.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import MaterialComponents.MDCButton
import UIKit

@IBDesignable
class LeftAlignedIconMDCButton: MDCButton {
  override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
    let titleRect = super.titleRect(forContentRect: contentRect)
    let imageSize = currentImage?.size ?? .zero
    let availableWidth = contentRect.width - imageEdgeInsets.right - imageSize.width - titleRect.width
    return titleRect.offsetBy(dx: round(availableWidth / 2), dy: 0)
  }
}
