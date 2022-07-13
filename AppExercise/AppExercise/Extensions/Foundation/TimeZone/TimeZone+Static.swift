//
//  TimeZone+Static.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//  

import Foundation

extension TimeZone {
  static var utc: TimeZone? { TimeZone(identifier: "UTC") }
}
