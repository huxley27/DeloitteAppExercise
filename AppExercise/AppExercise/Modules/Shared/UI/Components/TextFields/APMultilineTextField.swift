//
//  APMultilineTextField.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation
import UIKit

import MaterialComponents.MDCMultilineTextField
import RxSwift

class APMultilineTextField: MDCMultilineTextField, APTextFieldProtocol {
  var inputController: MDCTextInputControllerBase?
  
  @IBInspectable
  var minHeight: CGFloat = 0 {
    didSet { setupMinHeight() }
  }

  @IBInspectable
  var charLimit: Int = 0

  weak var charLimitLabel: UILabel? {
    didSet { bindCharLimit() }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    prepare()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    prepare()
  }

  override func awakeFromNib() {
    super.awakeFromNib()
    prepare()
  }

  func prepare() {
    textView?.delegate = self
  }
}

// MARK: - Setup

private extension APMultilineTextField {
  func setupMinHeight() {
    guard shouldSetMinHeight else { return }
    textView?.autoSetDimension(
      .height,
      toSize: minHeight,
      relation: .greaterThanOrEqual
    )
  }
}

// MARK: - Bind

private extension APMultilineTextField {
  func bindCharLimit() {
    guard let charLimitLabel = self.charLimitLabel,
      let textView = self.textView,
      shouldSetCharLimit else { return }

    let charLimitCount = Observable<Int>.just(charLimit)
    let textCount = textView.rx.text.orEmpty.map { $0.count }

    Observable
      .combineLatest(
        textCount,
        charLimitCount,
        resultSelector: { "\($0)/\($1)" }
      )
      .bind(to: charLimitLabel.rx.text)
      .disposed(by: rx.disposeBag)
  }
}

// MARK: - Getters

private extension APMultilineTextField {
  var shouldSetMinHeight: Bool { minHeight > 0 }
  var shouldSetCharLimit: Bool { charLimit > 0 }
}

// MARK: - UITextViewDelegate

extension APMultilineTextField: UITextViewDelegate {
  func textView(
    _ textView: UITextView,
    shouldChangeTextIn range: NSRange,
    replacementText text: String
  ) -> Bool {
    guard shouldSetCharLimit else { return true }
    return textView.text.count + (text.count - range.length) <= charLimit
  }
}
