//
//  ModelTrackingService.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

/// A type which can be bookmarked, followed, or faved by the app user.
protocol TrackableModel: Model, Identifiable {
  var isTracking: Bool { get }
}

enum ModelTrackingState {
  case tracking
  case tracked
  case untracking
  case untracked
}

protocol ModelTrackingService: AppServiceProtocol {
  /// Check whether the model with the specified ID is already being tracked or not.
  ///
  /// For states `tracking` and `untracking`, they'll be considered as `tracked` and `untracked`
  /// respectively. This is to simplify the handling in the call site.
  ///
  func isTrackingModel(with id: String) -> Bool

  /// Use this to add the model you'd like to track.
  func addModel<T>(_ model: T) where T: TrackableModel

  func addModels<T>(_ models: [T]) where T: TrackableModel

  /// Remove a model with the specified ID.
  ///
  /// Use this in cases where:
  /// - a model was permanently deleted.
  ///
  func removeModel(with id: String)

  /// Make sure to call this once the current user logs out.
  func removeAllModels()

  /// Track or untrack a model in behalf of the current app user.
  func toggleModelTrackingState(with id: String)
}
