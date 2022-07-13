//
//  DirtyFormCheckerProtocol.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

protocol DirtyFormCheckerProtocol {
  func resetHash()
  func isFormDirty() -> Bool
}
