//
//  Theme+Component.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2021 Huxley. All rights reserved.
//

// swiftlint:disable type_name
// swiftlint:disable nesting

import Foundation
import UIKit

extension Theme.component {
  enum loadBarButtonItem {
    static let foregroundColor: UIColor = R.color.primaryFull()!
    static let font: UIFont = T.font.semibold(ofSize: 17)
  }

  enum navBar {
    static let barTintColor: UIColor = R.color.backgroundLight()!
    static let font: UIFont = T.font.semibold(ofSize: 17)
    static let tintColor: UIColor = R.color.textOnLightRegular()!
  }

  enum progressHUD {
    static let backgroundColor: UIColor = R.color.greysLine()!
    static let backgroundLayerColor: UIColor = R.color.greysLine()!
  }

  enum snackbar {
    static let backgroundColor: UIColor = R.color.sheetDark()!
    static let font: UIFont = T.font.regular(ofSize: 17)
    static let foregroundColor: UIColor = R.color.textOnDarkRegular()!

    enum error {
      static let backgroundColor: UIColor = R.color.alertError()!
      static let foregroundColor: UIColor = R.color.textOnPrimaryRegular()!
    }

    enum success {
      static let backgroundColor: UIColor = R.color.alertSuccess()!
      static let foregroundColor: UIColor = R.color.textOnLightRegular()!
    }
  }

  enum viewController {
    static let backgroundColor: UIColor = R.color.backgroundLight()!
  }

  enum window {
    static let backgroundColor: UIColor = R.color.backgroundLight()!
    static let tintColor: UIColor = R.color.primaryFull()!
  }
}
