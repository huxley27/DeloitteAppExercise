//
//  AppConfig.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

protocol AppConfigProtocol {
  // MARK: Backend

  /// Backend server URL
  var baseUrl: String { get }

  /// API URL
  var apiUrl: String { get }
  var apiVersion: String { get }

  // MARK: Defaults

  /// Default pagination items per page
  var defaultPageSize: Int { get }
  /// Default compression quality for UIImage before sending to backend
  var defaultPhotoCompression: Float { get }
  /// Default debounce timer in seconds for resending of code to email and mobile number
  var defaultCodeResendTimerInSeconds: Float { get }

}

// MARK: - Default values

extension AppConfigProtocol {
  var apiUrl: String { "\(baseUrl)/api" }
  var apiVersion: String { "v1" }
  var apiUrlWithVersion: String { "\(apiUrl)/\(apiVersion)" }

  var defaultPageSize: Int { 10 }
  var defaultPhotoCompression: Float { 0.7 }
  var defaultCodeResendTimerInSeconds: Float { 60 }
}

// MARK: - Concrete Type
   
struct AppConfig: AppConfigProtocol {
  var baseUrl: String { "https://api.flickr.com" }
}
