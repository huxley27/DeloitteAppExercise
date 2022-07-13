//
//  InfoProtocol.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation
import UIKit

protocol InfoProtocol {
  var message: String { get }
  var foregroundColor: UIColor { get }
  var backgroundColor: UIColor { get }
  var duration: TimeInterval { get }
  var action: InfoAction? { get }
}

extension InfoProtocol {
  var duration: TimeInterval { 3 }
  var action: InfoAction? { nil }
}
