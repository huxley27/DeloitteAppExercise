//
//  UILabel+Rx.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

import RxCocoa
import RxSwift

extension UILabel {
  func bindHiddenIfEmptyOrNilText() {
    rx.observe(String.self, "text")
      .map { $0.isNilOrEmpty }
      .bind(to: rx.isHidden)
      .disposed(by: rx.disposeBag)
  }
}
