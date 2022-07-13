//
//  DialogPresenterProtocol.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation
import UIKit

protocol DialogPresenterProtocol {
  func presentDialog(
    _ dialog: DialogProtocol,
    from source: UIViewController
  )
}
