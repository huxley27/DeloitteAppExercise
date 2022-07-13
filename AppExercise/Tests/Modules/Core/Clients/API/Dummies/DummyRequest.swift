//
//  DummyRequest.swift
//  Tests
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

@testable import AppExercise

class DummyRequest: RequestProtocol {
  func resume() {}
  func suspend() {}
  func cancel() {}
}
