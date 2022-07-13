//
//  DialogProtocol.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//  

import Foundation

protocol DialogProtocol {
  var title: String? { get }
  var message: String? { get }
  var cancelOption: DialogOption? { get }
  var positiveOption: DialogOption? { get }
  var negativeOption: DialogOption? { get }
}
