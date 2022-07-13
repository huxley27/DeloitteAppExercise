//
//  APIClient+Upload.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Alamofire
import Foundation

extension APIClient {
  /// Uploads files and other info to the server with one request using `MultiparFormData`.
  ///
  /// It is **not recommended** to use this method directly on your `ViewControllers/Models`, instead create a wrapper method that is tailored for the action you want to perform.
  /// For example, if your app requires you to upload a profile image, create a wrapper function called `uploadProfileImage(image:)`. This way you have control on
  /// what parameters you want required, and the intent is much clearer for anyone reading your code.
  ///
  /// - Parameter endpointURL: Upload endpoint
  /// - Parameter payload: A closure for handling MultipartFormData
  /// - Parameter requiresAuth: Whether the endpoint needs auth or not
  /// - Parameter completion: A closure for handling the request
  func upload(
    to resourcePath: String,
    method: HTTPMethod = .post,
    version: String? = nil,
    with payload: @escaping (MultipartFormData) -> Void,
    requiresAuth: Bool = true,
    uploadProgress: SingleResult<Progress>? = nil,
    success: @escaping (APIResponse) -> Void,
    failure: @escaping (Error) -> Void
  ) {
    Alamofire.upload(
      multipartFormData: payload,
      to: endpointURL(resourcePath, version: version),
      method: method,
      headers: httpRequestHeaders(),
      encodingCompletion: { result in
        switch result {
        case let .success(request, _, _):
          request.uploadProgress(closure: { progress in
            uploadProgress?(progress)
          })
          request.apiResponse { result in
            switch result {
            case let .success(resp):
              success(resp)
            case let .failure(error):
              failure(error)
            }
          }
        case let .failure(error):
          App.shared.errorHandling.processError(error)
          return failure(error)
        }
      }
    )
  }
}

extension MultipartFormData {
  func append(_ params: [String: Any]) {
    for (key, value) in params {
      if let datum = value as? Data {
        appendDatum(
          datum,
          name: key
        )

      } else if let data = value as? [Data] {
        for (index, datum) in data.enumerated() {
          appendDatum(
            datum,
            name: "\(key)[\(index)]"
          )
        }
      } else if let boolValue = value as? Bool {
        append("\(boolValue.intValue())".data(using: .utf8)!, withName: key)
      } else if let stringConvertible = value as? CustomStringConvertible {
        append(stringConvertible.description.data(using: .utf8)!, withName: key)
      }
    }
  }
}

// MARK: - Helpers

private extension MultipartFormData {
  func appendDatum(
    _ datum: Data,
    name: String
  ) {
    let compressedDatum = datum.compressedImageData(
      quality: App.shared.config.defaultPhotoCompression
    )
    let finalDatum = compressedDatum ?? datum

    append(
      finalDatum,
      withName: name,
      fileName: UUID().uuidString + ".jpg",
      mimeType: "image/jpeg"
    )
  }
}
