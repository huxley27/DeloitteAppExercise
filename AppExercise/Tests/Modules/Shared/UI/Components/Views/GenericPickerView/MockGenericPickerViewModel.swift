//
//  MockGenericPickerViewModel.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

@testable import AppExercise

class MockGenericPickerViewModel: GenericPickerViewModelProtocol {
  var options: [String]?

  var onOptionsReload: VoidResult?
  var onOptionSelect: SingleResult<String>?
  var onOptionIndexSelect: SingleResult<Int>?

  private(set) var setOptionsValue: [String]?
  private(set) var setOptionsCallCount: Int = 0

  private(set) var selectOptionIndex: Int?
  private(set) var selectOptionCallCount: Int = 0
}

// MARK: - Methods

extension MockGenericPickerViewModel {
  func setOptions(_ options: [String]) {
    setOptionsValue = options
    setOptionsCallCount += 1
  }

  func selectOption(at index: Int) {
    selectOptionIndex = index
    selectOptionCallCount += 1
  }
}
