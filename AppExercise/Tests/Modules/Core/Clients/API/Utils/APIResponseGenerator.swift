//
//  APIReponseGenerator.swift
//  Tests
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation
import XCTest

import Quick

@testable import AppExercise

struct APIReponseGenerator {
  static func modelResponse<T: Decodable>(
    from jsonFileName: String,
    spec: XCTestCase,
    decoder: JSONDecoder,
    file: StaticString = #file,
    line: UInt = #line
  ) -> T? {
    do {
      let dict = try spec.jsonDictionaryFromFile(jsonFileName)
      let data = try JSONSerialization.data(withJSONObject: dict)
      return try decoder.decode(T.self, from: data)
    } catch {
      XCTFail(error.localizedDescription, file: file, line: line)
      return nil
    }
  }
}
