//
//  UICollectionView+Rx.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation
import UIKit

import RxCocoa
import RxSwift

extension Reactive where Base: UICollectionView {
  var contentSize: ControlEvent<CGSize> {
    let source: Observable<CGSize> = base.rx
      .observe(CGSize.self, "contentSize")
      .compactMap { $0 }
      .distinctUntilChanged()
    return ControlEvent(events: source)
  }
}
