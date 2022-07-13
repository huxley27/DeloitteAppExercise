//
//  UIImageView+Rx.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

import RxCocoa
import RxSwift

extension UIImageView {
  func bindHiddenIfNilImage() {
    rx.observe(UIImage.self, "image")
      .map { $0 == nil }
      .bind(to: rx.isHidden)
      .disposed(by: rx.disposeBag)
  }
}
