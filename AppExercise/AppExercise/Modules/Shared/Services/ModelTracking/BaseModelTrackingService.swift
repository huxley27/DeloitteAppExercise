//
//  BaseModelTrackingService.swift
//  QuestionInfluencers
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2019 Huxley. All rights reserved.
//

import Alamofire
import Foundation

class ModelTrackingInfo {
  var modelId: String
  var state: ModelTrackingState = .untracked
  var request: DataRequest?

  init<T>(_ model: T) where T: TrackableModel {
    modelId = model.idString
    state = model.isTracking ? .tracked : .untracked
  }
}

struct ModelTrackingServiceNotifications {
  /// A Notification sent after the API request has completed processing.
  ///
  /// UserInfo keys:
  /// - `model_id`: String. Id of the model being updated.
  /// - `error`: Error. Any error encountered when attempting to update the model.
  static let didUpdateModel = Notification.Name(rawValue: "ModelTrackingService.didUpdateModel")
}

/// Provides the app a sort of convenience layer for tracking or untracking `TrackableModel`s.
///
/// Advantages of having this layer instead of directly calling the endpoint wrappers:
///
/// - One place implementation for tracking/untracking a particular type of model.
/// - Changes to tracking status of the model is shared throughout the app via NSNotification.
/// - Changes can be displayed on the view instantaneously without having to wait for the request to complete.
/// - Takes care of the in-transit api request cancellation in case the user quickly changes his mind.
///
/// **Subclassing Notes:**
///
/// - It's best to limit this to level-1 subclasses for now. So make sure to use `final` keyword.
/// - For the most part, you only need to override the two following methods:
///
/// ```
///   final class UserBookmarkingService: BaseModelTrackingService {
///
///     override func modelTrackingRequest(
///       _ info: ModelTrackingInfo, completion: @escaping (Error?) -> Void
///     ) -> DataRequest {
///       return app.api.bookmarkUser(info.modelId, completion: completion)
///     }
///
///     override func modelUntrackingRequest(
///       _ info: ModelTrackingInfo, completion: @escaping (Error?) -> Void
///     ) -> DataRequest {
///       return app.api.unbookmarkUser(info.modelId, completion: completion)
///     }
///
///   }
/// ```
///
class BaseModelTrackingService: ModelTrackingService {
  private var modelMap: [String: ModelTrackingInfo] = [:]

  init() {
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(sessionLoggedOut),
      name: .didLogout,
      object: nil
    )
  }

  @objc private func sessionLoggedOut() {
    removeAllModels()
  }

  func addModel<T>(_ model: T) where T: TrackableModel {
    guard modelMap[model.idString] == nil else { return }
    modelMap[model.idString] = ModelTrackingInfo(model)
  }

  func addModels<T>(_ models: [T]) where T: TrackableModel {
    models.forEach { self.addModel($0) }
  }

  func removeModel(with id: String) {
    modelMap.removeValue(forKey: id)
  }

  func removeAllModels() {
    modelMap = [:]
  }

  func isTrackingModel(with id: String) -> Bool {
    guard let info = modelMap[id] else { return false }
    return info.state == .tracked || info.state == .tracking
  }

  func toggleModelTrackingState(with id: String) {
    guard let info = modelMap[id] else { return }
    if info.state == .tracked {
      untrackModel(info)
    } else if info.state == .untracked {
      trackModel(info)
    } else {
      rollbackModelState(info)
    }
  }

  func modelTrackingRequest(_ info: ModelTrackingInfo, completion: @escaping (Error?) -> Void) -> DataRequest {
    fatalError("Subclass should implement this")
  }

  func modelUntrackingRequest(_ info: ModelTrackingInfo, completion: @escaping (Error?) -> Void) -> DataRequest {
    fatalError("Subclass should implement this")
  }
}

// MARK: - Private Helpers

private extension BaseModelTrackingService {
  func trackModel(_ info: ModelTrackingInfo) {
    info.state = .tracking
    info.request = modelTrackingRequest(info, completion: { [weak self] error in
      guard let self = self else { return }

      info.state = error == nil ? .tracked : .untracked
      info.request = nil

      NotificationCenter.default.post(
        name: ModelTrackingServiceNotifications.didUpdateModel,
        object: self,
        userInfo: [
          "model_id": info.modelId,
          "error": error ?? false
        ]
      )
    })
  }

  func untrackModel(_ info: ModelTrackingInfo) {
    info.state = .untracking
    info.request = modelUntrackingRequest(info, completion: { [weak self] error in
      guard let self = self else { return }

      info.state = error == nil ? .untracked : .tracked
      info.request = nil

      NotificationCenter.default.post(
        name: ModelTrackingServiceNotifications.didUpdateModel,
        object: self,
        userInfo: [
          "model_id": info.modelId,
          "error": error ?? false
        ]
      )
    })
  }

  func rollbackModelState(_ info: ModelTrackingInfo) {
    if let req = info.request {
      req.cancel()
      info.request = nil
    }

    switch info.state {
    case .tracking, .untracked:
      info.state = .untracked
    case .untracking, .tracked:
      info.state = .tracked
    }

    NotificationCenter.default.post(
      name: ModelTrackingServiceNotifications.didUpdateModel,
      object: self,
      userInfo: [
        "model_id": info.modelId,
        "error": false
      ]
    )
  }
}
