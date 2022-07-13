//
//  DummyGenericCategory.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2021 Huxley. All rights reserved.
//

import Foundation

@testable import AppExercise

extension GenericCategory {
  init(
    testId: Int = 0,
    testLabel: String = ""
  ) {
    self.init(
      id: testId,
      label: testLabel
    )
  }
}
