//
//  KeyboardLayoutConstraints.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

// StackOverflow: https://stackoverflow.com/a/35468229
// Github: https://github.com/MengTo/Spring/blob/master/Spring/KeyboardLayoutConstraint.swift

import UIKit

#if !os(tvOS)
  @available(tvOS, unavailable)
  public class KeyboardLayoutConstraint: NSLayoutConstraint {
    @IBInspectable var offset: CGFloat = 0
    private var keyboardVisibleHeight: CGFloat = 0

    @available(tvOS, unavailable)
    public override func awakeFromNib() {
      super.awakeFromNib()

      offset = constant

      NotificationCenter.default.addObserver(
        self,
        selector: #selector(
          KeyboardLayoutConstraint.keyboardWillShowNotification(_:)
        ),
        name: UIWindow.keyboardWillShowNotification,
        object: nil
      )
      NotificationCenter.default.addObserver(
        self,
        selector: #selector(
          KeyboardLayoutConstraint.keyboardWillHideNotification(_:)
        ),
        name: UIWindow.keyboardWillHideNotification,
        object: nil
      )
    }

    deinit {
      NotificationCenter.default.removeObserver(self)
    }

    // MARK: Notification

    @objc func keyboardWillShowNotification(_ notification: Notification) {
      if let userInfo = notification.userInfo {
        if let frameValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
          let frame = frameValue.cgRectValue
          keyboardVisibleHeight = frame.size.height
        }

        updateConstant()

        let values = (
          userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber,
          userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber
        )

        switch values {
        case let (.some(duration), .some(curve)):

          let options = UIView.AnimationOptions(rawValue: curve.uintValue)

          UIView.animate(
            withDuration: TimeInterval(duration.doubleValue),
            delay: 0,
            options: options,
            animations: {
              UIApplication.shared.firstKeyWindow?.layoutIfNeeded()
            }
          )
        default:

          break
        }
      }
    }

    @objc func keyboardWillHideNotification(_ notification: NSNotification) {
      keyboardVisibleHeight = 0
      updateConstant()

      if let userInfo = notification.userInfo {
        let values = (
          userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber,
          userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber
        )

        switch values {
        case let (.some(duration), .some(curve)):

          let options = UIView.AnimationOptions(rawValue: curve.uintValue)

          UIView.animate(
            withDuration: TimeInterval(duration.doubleValue),
            delay: 0,
            options: options,
            animations: {
              UIApplication.shared.firstKeyWindow?.layoutIfNeeded()
            }
          )
        default:
          break
        }
      }
    }

    func updateConstant() {
      guard keyboardVisibleHeight > 0 else {
        constant = offset
        return
      }

      let bottomPadding = UIApplication.shared.firstKeyWindow!.safeAreaInsets.bottom
      constant = offset + keyboardVisibleHeight - bottomPadding
    }
  }
#endif
