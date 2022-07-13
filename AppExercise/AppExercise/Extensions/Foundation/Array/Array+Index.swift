//
//  Array+Index.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

extension Array {
  subscript(safe idx: Int) -> Element? {
    idx < endIndex ? self[idx] : nil
  }
}
