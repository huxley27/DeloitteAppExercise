//
//  TriggerableProtocol.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//  

import Foundation

protocol TriggerableProtocol: AnyObject {}

extension TriggerableProtocol {
  
  /// Call this to skip making handlers
  ///
  /// Before:
  ///
  /// ```
  /// func handleSomeEvent() -> VoidResult  {
  ///   return { [weak self] in
  ///     guard let self = self else { return }
  ///     self.someMethod()
  ///   }
  /// }
  ///
  /// self.onSomeEvent = handleSomeEvent()
  /// ```
  ///
  /// now becomes...
  ///
  /// ```
  /// self.onSomeEvent = trigger(type(of: self).someMethod)
  /// ```
  ///
  func trigger(_ callback: @escaping (Self) -> VoidResult) -> VoidResult {
    return { [weak self] in
      guard let self = self else { return }
      return callback(self)()
    }
  }

  /// Call this to skip making handlers
  ///
  /// Before:
  ///
  /// ```
  /// func handleSomeEvent() -> SingleResult<[Model]>  {
  ///   return { [weak self] models in
  ///     guard let self = self else { return }
  ///     self.someMethod(models)
  ///   }
  /// }
  ///
  /// self.onSomeEvent = handleSomeEvent()
  /// ```
  ///
  /// now becomes...
  ///
  /// ```
  /// self.onSomeEvent = trigger(type(of: self).someMethod)
  /// ```
  ///
  func trigger<T>(_ callback: @escaping (Self) -> SingleResult<T>) -> SingleResult<T> {
    return { [weak self] result in
      guard let self = self else { return }
      return callback(self)(result)
    }
  }
  
  /// Call this to skip making handlers
  ///
  /// Before:
  ///
  /// ```
  /// func handleSomeEvent() -> VoidResult  {
  ///   return { [weak self] in
  ///     guard let self = self else { return }
  ///     self.onCallback?()
  ///   }
  /// }
  ///
  /// self.onSomeEvent = handleSomeEvent()
  /// ```
  ///
  /// now becomes...
  ///
  /// ```
  /// self.onSomeEvent = trigger(\.onCallback)
  /// ```
  ///
  func trigger(_ keypath: KeyPath<Self, VoidResult?>) -> VoidResult {
    return { [weak self] in
      guard let self = self else { return }
      let callback = self[keyPath: keypath]
      callback?()
    }
  }
  
  /// Call this to skip making handlers
  ///
  /// Before:
  ///
  /// ```
  /// func handleSomeEvent() -> VoidResult  {
  ///   return { [weak self] result in
  ///     guard let self = self else { return }
  ///     self.onCallback?(result)
  ///   }
  /// }
  ///
  /// self.onSomeEvent = handleSomeEvent()
  /// ```
  ///
  /// now becomes...
  ///
  /// ```
  /// self.onSomeEvent = trigger(\.onCallback)
  /// ```
  ///
  func trigger<T>(_ keypath: KeyPath<Self, SingleResult<T>?>) -> SingleResult<T> {
    return { [weak self] result in
      guard let self = self else { return }
      let callback = self[keyPath: keypath]
      callback?(result)
    }
  }
}

extension NSObject: TriggerableProtocol {}
