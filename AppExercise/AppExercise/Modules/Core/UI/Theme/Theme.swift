//
//  Theme.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2021 Huxley. All rights reserved.
//

// swiftlint:disable type_name

import UIKit

typealias T = Theme

enum Theme {
  enum font {}
  enum textStyle {}

  /// Holds styling variables for specific components. Mostly built-in components that's not included
  /// on the stylesheet document.
  enum component {}

  /// Holds all measurement related stuff. `dimens` term is copied from Android
  enum dimens {}
}
