//
//  FlickrItem.swift
//  AppExercise
//
//  Created by HUXLEY ALCAIN on 7/14/22.
//  Copyright © 2022 Huxley. All rights reserved.
//

import Foundation

struct FlickrItem: Codable {
  
  var id: String
  var owner: String
  var secret: String
  var server: String
  var farm: Int
  var title: String
  var ispublic: Int
  var isfriend: Int
  var isfamily: Int
}
