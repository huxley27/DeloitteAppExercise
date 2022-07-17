//
//  DummyFlickrPhoto.swift
//  Tests
//
//  Created by HUXLEY ALCAIN on 7/18/22.
//  Copyright © 2022 Huxley. All rights reserved.
//

import Foundation

@testable import AppExercise

extension FlickrPhotos {
  init() {
    self.init(
      perpage: 1,
      pages: 1,
      page: 1,
      total: 1,
      photo: []
    )
  }
}
