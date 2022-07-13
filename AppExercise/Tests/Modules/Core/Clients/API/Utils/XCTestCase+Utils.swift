//
//  XCTestCase+Utils.swift
//  Tests
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation
import XCTest

import AppExercise

extension XCTestCase {
  func jsonDictionaryFromFile(_ name: String) throws -> JSONDictionary {
    return try AppExercise.jsonDictionaryFromFile(name, bundle: Bundle(for: type(of: self)))!
  }
}
