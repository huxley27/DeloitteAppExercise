//
//  GenericPickerViewModelProtocol.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

protocol GenericPickerViewModelProtocol: class {
  var onOptionsReload: VoidResult? { get set }
  var onOptionIndexSelect: SingleResult<Int>? { get set }
  var onOptionSelect: SingleResult<String>? { get set }

  var options: [String]? { get }

  func setOptions(_ options: [String])
  func selectOption(at index: Int)
}
