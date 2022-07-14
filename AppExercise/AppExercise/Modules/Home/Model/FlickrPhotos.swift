//
//  FlickrPhotos.swift
//  AppExercise
//
//  Created by HUXLEY ALCAIN on 7/15/22.
//  Copyright © 2022 Huxley. All rights reserved.
//

import Foundation

struct FlickrPhotos: Codable {
  var perpage: Int
  var pages: Int
  var page: Int
  var total: Int
  var photo: [FlickrItem]
}
