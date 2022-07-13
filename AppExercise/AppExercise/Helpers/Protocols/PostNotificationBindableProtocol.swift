//
//  PostNotificationBindableProtocol.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

import NSObject_Rx

protocol PostNotificationBindableProtocol: HasDisposeBag {
  func bindPostNotification(
    notificationName: Notification.Name,
    onPost: @escaping SingleResult<Notification>
  )
}

// MARK: - Defaults

extension PostNotificationBindableProtocol {
  func bindPostNotification(
    notificationName: Notification.Name,
    onPost: @escaping SingleResult<Notification>
  ) {
    NotificationCenter.default.rx
      .notification(notificationName)
      .subscribe(onNext: onPost)
      .disposed(by: disposeBag)
  }
}

// MARK: - Base Conformances

extension UIView: PostNotificationBindableProtocol {}
extension UIViewController: PostNotificationBindableProtocol {}
