//
//  Photo.Update.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2021 Huxley. All rights reserved.
//

import Foundation

extension Photo {
  struct Update: APIModel, Codable {
    let id: Int
    var delete: Bool?
  }
}
