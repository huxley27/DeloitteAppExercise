//
//  ScrollableController.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation
import UIKit

protocol ScrollableController: KeyboardEditable {
  var scrollView: UIScrollView! { get set }
}

extension ScrollableController where Self: UIViewController {
  func keyboardWillShowOrHideHandler(_ notification: Notification) {
    // Pull a bunch of info out of the notification
    if let userInfo = notification.userInfo,
      let endValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey],
      let durationValue = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] {
      // Transform the keyboard's frame into our view's coordinate system
      let endRect = view.convert((endValue as AnyObject).cgRectValue, from: view.window)

      // Find out how much the keyboard overlaps the scroll view
      // We can do this because our scroll view's frame is already in our view's coordinate system
      let keyboardOverlap = scrollView.frame.maxY - endRect.origin.y

      // Set the scroll view's content inset to avoid the keyboard
      // Don't forget the scroll indicator too!
      scrollView.contentInset.bottom = keyboardOverlap
      scrollView.verticalScrollIndicatorInsets.bottom = keyboardOverlap

      let duration = (durationValue as AnyObject).doubleValue
      UIView.animate(withDuration: duration!, delay: 0, options: .beginFromCurrentState, animations: {
        self.view.layoutIfNeeded()
      }, completion: nil)
    }
  }
}
