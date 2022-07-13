//
//  MockDevicesAPI.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

@testable import AppExercise

class MockDevicesAPI: DevicesAPI {
  var errorToReturn: Error?

  private(set) var postDevicesCallCount = 0

  func reset() {
    errorToReturn = nil
  }
}

extension MockDevicesAPI {
  func postDevices(
    token: String,
    onSuccess: @escaping VoidResult,
    onError: @escaping ErrorResult
  ) -> RequestProtocol {
    postDevicesCallCount += 1

    if let e = errorToReturn {
      onError(e)
    } else {
      onSuccess()
    }

    return DummyRequest()
  }
}
