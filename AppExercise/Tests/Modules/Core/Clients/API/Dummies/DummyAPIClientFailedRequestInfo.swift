//
//  DummyAPIClientFailedRequestInfo.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

@testable import AppExercise

extension APIClientFailedRequestInfo {
  init(
    testStatus: HTTPStatusCode = .accepted,
    testMessage: String = "",
    testErrorCode: APIErrorCode = .default
  ) {
    self.init(
      status: testStatus,
      message: testMessage,
      errorCode: testErrorCode
    )
  }
}
