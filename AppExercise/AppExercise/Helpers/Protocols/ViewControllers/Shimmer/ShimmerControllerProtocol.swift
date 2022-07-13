//
//  ShimmerControllerProtocol.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation
import UIKit

import SkeletonView

protocol ShimmerControllerProtocol where Self: UIViewController {
  func show(in parent: UIViewController)
  func hide()
}

extension ShimmerControllerProtocol {
  func show(in vc: UIViewController) {
    addAsChild(to: vc)

    view.showAnimatedGradientSkeleton(
      animation: GradientDirection.topLeftBottomRight.slidingAnimation()
    )
  }

  func hide() {
    removeAsChild()
  }
}
