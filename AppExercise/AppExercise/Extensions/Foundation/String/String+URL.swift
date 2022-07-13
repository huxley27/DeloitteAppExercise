//
//  String+URL.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

extension String {
  var url: URL? { URL(string: self) }
}
