//
//  GenericPickerViewModel.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

class GenericPickerViewModel: GenericPickerViewModelProtocol {
  var onOptionsReload: VoidResult?
  var onOptionSelect: SingleResult<String>?
  var onOptionIndexSelect: SingleResult<Int>?

  private(set) var options: [String]?
}

// MARK: - Methods

extension GenericPickerViewModel {
  func setOptions(_ options: [String]) {
    self.options = options
    onOptionsReload?()
  }

  func selectOption(at index: Int) {
    onOptionIndexSelect?(index)

    guard let selectedOption = options?[index] else { return }
    onOptionSelect?(selectedOption)
  }
}
