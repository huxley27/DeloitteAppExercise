//
//  APIResponse.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2018 Huxley. All rights reserved.
//

import Foundation

/// An object representation of the server's JSON response.
struct APIResponse {
  /// Intentionally set to Optional-Any as it could be of any type or just be nil.
  /// It's up to the call site to determine the exact type of its value.
  /// If it's a Decodable type, use the method `decodedValue(forKeyPath:decoder:)`.
  let data: Any?
  let statusCode: HTTPStatusCode

  /// Could be a success or an error message depending on the type of result.
  let message: String?
  let errorCode: APIErrorCode

  let errors: [String: [String]]?
}

extension APIResponse: Decodable {
  enum CodingKeys: String, CodingKey {
    case data, message, errors
    case statusCode = "http_status"
    case errorCode = "error_code"
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    data = (try container.decodeIfPresent(AnyDecodable.self, forKey: .data))?.value
    message = try container.decodeIfPresent(String.self, forKey: .message)
    errors = try container.decodeIfPresent([String: [String]].self, forKey: .errors)
    statusCode = try container.decode(HTTPStatusCode.self, forKey: .statusCode)
    errorCode = (try? container.decode(APIErrorCode.self, forKey: .errorCode)) ?? .default
  }
}

// MARK: - Helpers

extension APIResponse {
  /// Decodes the contents of the `data` property, if available, into its inferred Decodable type.
  ///
  /// Sample usage:
  ///
  ///     // Single object:
  ///     // {
  ///     //   "status": 200,
  ///     //   "data": {
  ///     //     "post_id": "xyz123", "title": "...", ...
  ///     //   }
  ///     // }
  ///     let post: Post! = instance.decodedValue()
  ///
  ///     // Array of objects:
  ///     // {
  ///     //   "status": 200,
  ///     //   "data": {
  ///     //     "posts": [{...}, {...}, ...]
  ///     //   }
  ///     // }
  ///     let posts: [Post]? = instance.decodedValue(forKeyPath: "posts")
  ///
  /// - parameter forKeyPath: Specify as needed. This only works with Dictionary types.
  ///       If nil, assumes `data` is for the inferred decodable type.
  /// - parameter decoder: A pre-configured JSONDecoder instance. Defaults to `GenericAPIModel`s decoder.
  ///
  /// - returns: The decoded value or nil.
  func decodedValue<T>(forKeyPath: String? = nil, decoder: JSONDecoder? = nil) -> T? where T: Decodable {
    guard var payload = data else { return nil }

    if let keyPath = forKeyPath {
      guard let d = nestedData(keyPath) else { return nil }
      payload = d
    }

    guard JSONSerialization.isValidJSONObject(payload) else {
      debugLog("payload: \(String(describing: payload))")
      guard let val = payload as? T else { return nil }
      return val
    }

    do {
      let json = try JSONSerialization.data(withJSONObject: payload)
      return try (decoder ?? GenericAPIModel.decoder()).decode(T.self, from: json)

    } catch {
      App.shared.errorHandling.processError(error, info: ["keyPath": forKeyPath ?? "n/a"])
      return nil
    }
  }

  /// Returns the data at the given `keyPath`. Nil if path doesn't exist.
  private func nestedData(_ keyPath: String) -> Any? {
    guard let payload = data, !keyPath.isEmpty else { return nil }
    guard let dict = payload as? [String: Any] else { return nil }
    return dict[keyPath: keyPath] as Any
  }
}
