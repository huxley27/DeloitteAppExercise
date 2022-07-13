//
//  AppServiceProtocol.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

import NSObject_Rx
import RxSwift

protocol AppServiceProtocol: AnyObject {
}

// MARK: - Notifications

extension AppServiceProtocol {
  private var notificationCenter: NotificationCenter { .default }

  func postModelNotification<T>(
    withName name: Notification.Name,
    model: T
  ) where T: Model & Encodable {
    notificationCenter.post(
      name: name,
      object: self,
      userInfo: model.dictionary()
    )
  }

  func postNotification(withName name: Notification.Name) {
    notificationCenter.post(
      name: name,
      object: self
    )
  }

  func bindModelNotification<T>(
    withName name: Notification.Name,
    onPost: @escaping SingleResult<T>,
    to observer: HasDisposeBag
  ) where T: Model & Decodable {
    notificationCenter.rx
      .notification(
        name,
        object: self
      )
      .compactMap { $0.userInfo }
      .compactMap { $0 as? [String: Any] }
      .compactMapModel(T.self)
      .bind(onNext: onPost)
      .disposed(by: observer.disposeBag)
  }

  func bindNotification(
    withName name: Notification.Name,
    onPost: @escaping VoidResult,
    to observer: HasDisposeBag
  ) {
    notificationCenter.rx
      .notification(
        name,
        object: self
      )
      .mapToVoid()
      .bind(onNext: onPost)
      .disposed(by: observer.disposeBag)
  }
}
