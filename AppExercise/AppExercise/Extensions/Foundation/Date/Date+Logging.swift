//
//  Date+Logging.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2018 Huxley. All rights reserved.
//

import Foundation

extension Date {
  func dblog() -> String {
    return Constants.Formatters.debugConsoleDateFormatter.string(from: self)
  }
}
