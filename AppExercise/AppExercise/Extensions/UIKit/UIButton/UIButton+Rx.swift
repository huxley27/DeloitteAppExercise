//
//  UIButton+Rx.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

import RxCocoa
import RxSwift

extension Reactive where Base: UIButton {
  /// Reactive wrapper for `sendActions(for:)`
  func sendActions<T>(for controlEvents: UIControl.Event) -> Binder<T> {
    return Binder(base) { button, _ in
      button.sendActions(for: controlEvents)
    }
  }
}
