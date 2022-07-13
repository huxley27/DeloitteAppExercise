//
//  GenericPickerView.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation
import UIKit

import RxSwift

class GenericPickerView: UIPickerView {
  var viewModel: GenericPickerViewModelProtocol! {
    didSet { setupVM() }
  }

  weak var textField: UITextField? {
    didSet { setupTextField() }
  }

  convenience init() {
    self.init(frame: .zero)
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    onInit()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    onInit()
  }

  private func onInit() {
    dataSource = self
    delegate = self
  }
}

// MARK: Setup

private extension GenericPickerView {
  func setupVM() {
    setupHandlers()
  }

  func setupHandlers() {
    viewModel.onOptionSelect = handleOptionSelect()
    viewModel.onOptionsReload = handleOptionsReload()
  }

  func setupTextField() {
    guard let tf = textField else { return }

    let tb = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40))
    let space = UIBarButtonItem(
      barButtonSystemItem: .flexibleSpace,
      target: nil,
      action: nil
    )
    let doneButton = UIBarButtonItem(
      barButtonSystemItem: .done,
      target: self,
      action: #selector(toolbarDoneButtonTapped)
    )
    tb.items = [space, doneButton]

    tf.inputView = self
    tf.inputAccessoryView = tb
    
    tf.rightViewMode = .always
    tf.rightView = UIImageView(image: R.image.chevronDownGray())
  }
}

// MARK: - Actions

private extension GenericPickerView {
  @objc
  func toolbarDoneButtonTapped() {
    let selectedIndex = selectedRow(inComponent: 0)
    viewModel.selectOption(at: selectedIndex)
    textField?.resignFirstResponder()
  }
}

// MARK: - Handlers

private extension GenericPickerView {
  func handleOptionSelect() -> SingleResult<String> {
    return { [weak self] option in
      guard let self = self else { return }
      self.textField?.text = option
    }
  }

  func handleOptionsReload() -> VoidResult {
    return { [weak self] in
      guard let self = self else { return }
      self.reloadAllComponents()
    }
  }
}

// MARK: - UIPickerViewDataSoure

extension GenericPickerView: UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }

  func pickerView(
    _ pickerView: UIPickerView,
    numberOfRowsInComponent component: Int
  ) -> Int {
    return viewModel.options?.count ?? 0
  }
}

// MARK: - UIPickerViewDelegate

extension GenericPickerView: UIPickerViewDelegate {
  func pickerView(
    _ pickerView: UIPickerView,
    didSelectRow row: Int,
    inComponent component: Int
  ) {
    viewModel.selectOption(at: row)
  }

  func pickerView(
    _ pickerView: UIPickerView,
    titleForRow row: Int,
    forComponent component: Int
  ) -> String? {
    return viewModel.options?[row]
  }
}
