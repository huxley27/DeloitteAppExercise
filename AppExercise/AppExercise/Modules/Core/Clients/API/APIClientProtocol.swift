//
//  APIClientProtocol.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

/// NOTE Swift 5 includes a standard Result type.
enum APIClientResult<Value> {
  case success(Value)
  case failure(Error)
}

enum HTTPRequestHeaderContentType: String {
  case json = "application/json"
  case urlEncoded = "application/x-www-form-urlencoded"
}

protocol APIClientProtocol: AppServiceProtocol {
  /// The base URL of the REST API sans the version. E.g. `https://api.domain.com/`
  var baseURL: URL { get }

  /// The default version of the API to use. E.g. `v1`, `v2.1`.
  var version: String { get }
}

extension APIClientProtocol {
  /// Construct the Endpoint's URL based on the given `resourcePath` value.
  ///
  /// - parameters:
  ///   - resourcePath: The endpoint's resource path. E.g. `auth/mobile/verify`
  ///   - version: The version of the endpoint to use. Defaults to type's `version` property.
  ///
  /// - returns: URL
  func endpointURL(_ resourcePath: String, version: String? = nil) -> URL {
    return baseURL.appendingPathComponent("/\(resourcePath)")
  }

  /// Returns the default set of HTTP headers.
  ///
  /// - parameter contentType: The type of data sent in requests such as POST and PUT.
  ///
  func httpRequestHeaders(
    contentType: HTTPRequestHeaderContentType = .json
  ) -> [String: String] {
    var headers = [
      "Content-Type": contentType.rawValue
    ]
    if contentType == .json {
      headers["Accept"] = contentType.rawValue
    }
    return headers
  }
}

protocol APIClientFailedRequestInfoType {
  var status: HTTPStatusCode { get }

  var message: String { get }

  var errorCode: APIErrorCode { get }
}

// MARK: - APIClientError

// TODO: Add conformance to CustomNSError.
enum APIClientError: Error {
  case failedRequest(APIClientFailedRequestInfoType)

  /// Indicates that a non-optional value of the given type was expected,
  /// but a null value was found.
  case dataNotFound(_ expectedType: Any.Type)

  case unknown
}

extension APIClientError: LocalizedError {
  var errorDescription: String? {
    switch self {
    case let .failedRequest(info):
      return info.message
    case .dataNotFound:
      return S.errorDevDataUnexpected()
    default:
      return S.errorDevUnknown()
    }
  }

  var failureReason: String? {
    switch self {
    case let .failedRequest(info):
      return S.devHttp(String(describing: info.status), info.message)
    case let .dataNotFound(type):
      return S.errorDevNotExpected(String(describing: type))
    default:
      return S.errorDevUnknown()
    }
  }
}
