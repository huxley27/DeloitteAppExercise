//
//  KeyboardEditable.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Keyboard

protocol KeyboardEditable {
  func keyboardWillShowOrHideHandler(_ notification: Notification)
}

extension KeyboardEditable where Self: UIResponder {
  // MARK: - Interactive Keyboard Dismissal For UIScrollView

  // Ref: https://realm.io/news/tmi-scrollview-for-keyboards/

  /// Register to be notified if the keyboard is changing size
  func addKeyboardVisibilityEventObservers() {
    let nc = NotificationCenter.default
    _ = nc.addObserver(
      forName: UIResponder.keyboardWillShowNotification,
      object: nil,
      queue: OperationQueue.main
    ) { [weak self] notif in
      self?.keyboardWillShowOrHideHandler(notif)
    }
    _ = nc.addObserver(
      forName: UIResponder.keyboardWillHideNotification,
      object: nil,
      queue: OperationQueue.main
    ) { [weak self] notif in
      self?.keyboardWillShowOrHideHandler(notif)
    }
  }
}
