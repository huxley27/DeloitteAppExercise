//
//  UIViewController+StatusBar.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
  func applyStatusBarColor(_ color: UIColor?, customViewTag: Int = 999) {
    let statusBarView = view.viewWithTag(customViewTag)

    guard statusBarView == nil else {
      if color == nil {
        statusBarView?.removeFromSuperview()
      } else {
        statusBarView?.backgroundColor = color
      }
      return
    }

    let subview = UIView()
    subview.tag = customViewTag
    subview.backgroundColor = color
    view.addSubview(subview)

    guard let keyWindow = UIApplication.shared.firstKeyWindow,
      let statusBarManager = keyWindow.windowScene?.statusBarManager else {
        return
    }

    let statusBarHeight = statusBarManager.statusBarFrame.size.height
    subview.translatesAutoresizingMaskIntoConstraints = false
    subview.heightAnchor.constraint(equalToConstant: statusBarHeight).isActive = true
    subview.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
    subview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    subview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
  }
}
