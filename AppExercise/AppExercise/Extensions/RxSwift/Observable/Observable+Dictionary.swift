//
//  Observable+Dictionary.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2021 Huxley. All rights reserved.
//

import Foundation

import RxSwift

extension Observable where Element == [String: Any] {
  func mapModel<T>(_ modelType: T.Type) -> Observable<T?> where T: Model & Decodable {
    map { dictionary in
      do {
        let model = try modelType.decode(dictionary)
        return model
      } catch {
        return nil
      }
    }
  }

  func compactMapModel<T>(_ modelType: T.Type) -> Observable<T> where T: Model & Decodable {
    mapModel(modelType)
      .compactMap { $0 }
  }
}
