//
//  HeroAnimation.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

enum HeroAnimation: String {
  case createPost
  case postAuthorView
  case postView
}

// MARK: - Helpers

extension HeroAnimation {
  var id: String { rawValue }

  func createID(withKey key: String) -> String {
    "\(key) \(rawValue)"
  }
}
