//
//  DummyAvatar.swift
//  Tests
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

@testable import AppExercise

extension Photo {
  init(
    testURL: URL = .dummy,
    testThumbURL: URL = .dummyThumb
  ) {
    self.init(
      id: 0,
      url: testURL,
      thumbUrl: testThumbURL
    )
  }
}
