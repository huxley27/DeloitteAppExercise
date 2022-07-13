//
//  Photo.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

struct Photo: APIModel, Codable {
  let id: Int
  let url: URL
  let thumbUrl: URL
}
