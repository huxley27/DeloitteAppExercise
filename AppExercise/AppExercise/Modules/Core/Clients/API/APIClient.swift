//
//  APIClient.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2018 Huxley. All rights reserved.
//

import Alamofire
import Foundation

typealias APIClientResultClosure = (APIClientResult<APIResponse>) -> Void
typealias APIClientBoolMessageClosure = (Bool, _ message: String?) -> Void

struct APIClientFailedRequestInfo: APIClientFailedRequestInfoType {
  let status: HTTPStatusCode
  let message: String
  let errorCode: APIErrorCode
}

class APIClient: APIClientProtocol {
  private(set) var sessionManager: Alamofire.SessionManager
  private(set) var baseURL: URL
  private(set) var version: String
  
  init(
    sessionManager: Alamofire.SessionManager = .default,
    baseURL: URL,
    version: String
  ) {
    self.sessionManager = sessionManager
    self.baseURL = baseURL
    self.version = version
  }

  func httpRequestHeaders(
    contentType: HTTPRequestHeaderContentType = .json,
    additionalHeaders: HTTPHeaders? = nil
  ) -> [String: String] {
    var headers = [
      "Content-Type": contentType.rawValue
    ]
    if contentType == .json {
      headers["Accept"] = "application/json"
    }

    if let additionalHeaders = additionalHeaders {
      headers.merge(
        additionalHeaders,
        uniquingKeysWith: { $1 }
      )
    }

    return headers
  }
}

extension APIClient {
  /// This wraps the call to `Alamofire.request(...).apiResponse(result:)`.
  ///
  /// - parameters:
  ///   - resourcePath: The path of the API resource.
  ///   - method: The HTTP method for this API resource.
  ///   - version: Optional. Defaults to whatever the value of `self.version` property is.
  ///   - parameters: The parameters for this API resource. `nil` by default.
  ///   - encoding: The parameter encoding to use. Defaults to `URLEncoding.default`.
  ///   - headers: The HTTP headers. Defaults to calling `httpRequestHeaders(withAuth:)`.
  ///   - success: Accepts `APIResponse` instance.
  ///   - failure: Accepts `Error` instance.
  ///
  func request(
    _ resourcePath: String,
    method: HTTPMethod = .get,
    version: String? = nil,
    parameters: Parameters? = nil,
    encoding: ParameterEncoding = URLEncoding.default,
    headers: HTTPHeaders? = nil,
    success: @escaping (APIResponse) -> Void,
    failure: @escaping (Error) -> Void
  ) -> DataRequest {
    return sessionManager
      .request(
        endpointURL(resourcePath, version: version),
        method: method,
        parameters: parameters,
        encoding: encoding,
        headers: headers ?? httpRequestHeaders()
      )
      .apiResponse(completion: { result in
        switch result {
        case let .success(resp):
          success(resp)
        case let .failure(error):
          failure(error)
        }
      })
  }
}

// MARK: - Alamofire.DataRequest

extension DataRequest {
  @discardableResult
  func apiResponse(
    queue: DispatchQueue? = nil,
    completion: @escaping APIClientResultClosure
  ) -> DataRequest {
    return responseData(queue: queue, completionHandler: { (response: DataResponse<Data>) in

      if let responseError = response.result.error {
        App.shared.errorHandling.processError(responseError)
        return completion(.failure(responseError))
      }

      guard let responseData = response.value else {
        return completion(.failure(APIClientError.dataNotFound(Data.self)))
      }

      do {
        let resp = try JSONDecoder().decode(APIResponse.self, from: self.utf8Data(from: responseData))

        if let code = HTTPStatusCode(rawValue: response.response!.statusCode),
          code.isRequestError || code.isServerError {
          let info = APIClientFailedRequestInfo(
            status: code,
            message: resp.message ?? S.generalErrorLabelsTypeUnknown(),
            errorCode: resp.errorCode
          )
          let apiError = APIClientError.failedRequest(info)
          App.shared.errorHandling.processAPIError(apiError)
          completion(.failure(apiError))
        } else {
          completion(.success(resp))
        }

      } catch {
        App.shared.errorHandling.processError(error)
        completion(.failure(error))
      }
    })
  }

  // TODO: Throw error
  private func utf8Data(from data: Data) -> Data {
    let encoding = detectEncoding(of: data)
    guard encoding != .utf8 else { return data }
    guard let responseString = String(data: data, encoding: encoding) else {
      preconditionFailure("Could not convert data to string with encoding \(encoding.rawValue)")
    }
    guard let utf8Data = responseString.data(using: .utf8) else {
      preconditionFailure("Could not convert data to UTF-8 format")
    }
    return utf8Data
  }

  private func detectEncoding(of data: Data) -> String.Encoding {
    var convertedString: NSString?
    let encoding = NSString.stringEncoding(
      for: data,
      encodingOptions: nil,
      convertedString: &convertedString,
      usedLossyConversion: nil
    )
    debugLog("~~> \(encoding)")
    return String.Encoding(rawValue: encoding)
  }
}

// MARK: - Model Decoding

extension APIClient {
  func decodeModel<T>(
    onSuccess: @escaping SingleResult<T>,
    onError: @escaping ErrorResult
  ) -> SingleResult<APIResponse> where T: Decodable {
    return { apiResponse in
      guard let model: T = apiResponse.decodedValue() else {
        return onError(AppError.unknown)
      }
      onSuccess(model)
    }
  }
}
