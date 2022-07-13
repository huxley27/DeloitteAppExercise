//
//  DirtyFormChecker.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation
import UIKit

class DirtyFormChecker: DirtyFormCheckerProtocol {
  private let views: [UIView]
  private var initialHash: Int?

  init(views: [UIView]) {
    self.views = views
  }

  func resetHash() {
    initialHash = generateHash()
  }

  func isFormDirty() -> Bool {
    let newHash = generateHash()
    return newHash != initialHash
  }
}

// MARK: - Utils

private extension DirtyFormChecker {
  func generateHash() -> Int {
    var hasher = Hasher()

    views
      .forEach { view in
        if let textField = view as? UITextField {
          hasher.combine(textField.text)
        } else if let textView = view as? UITextView {
          hasher.combine(textView.text)
        } else if let imageView = view as? UIImageView {
          hasher.combine(imageView.image)
        }
      }

    return hasher.finalize()
  }
}
