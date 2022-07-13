//
//  ShimmerPresenterProtocol.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation
import UIKit

protocol ShimmerPresenterProtocol where Self: UIViewController {
  var shimmerVC: ShimmerControllerProtocol! { get }

  func showShimmer()
  func hideShimmer()
}

extension ShimmerPresenterProtocol {
  func showShimmer() {
    shimmerVC?.show(in: self)
  }

  func hideShimmer() {
    shimmerVC?.hide()
  }
}
