//
//  FormTextField.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2018 Huxley. All rights reserved.
//

import UIKit

@IBDesignable
class FormTextField: UITextField {
  @IBInspectable var borderWidth: CGFloat = 1 {
    didSet {
      layer.borderWidth = borderWidth
    }
  }

  @IBInspectable var activeBorderColour: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3153360445)

  @IBInspectable var borderColour: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3153360445) {
    didSet {
      layer.borderColor = borderColour.cgColor
    }
  }

  @IBInspectable var placeholderTextColor: UIColor = .lightGray {
    didSet {
      let placeholderConfig = [NSAttributedString.Key.foregroundColor: placeholderTextColor]
      attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: placeholderConfig)
    }
  }

  @IBInspectable var cornerRadius: CGFloat = 4 {
    didSet {
      layer.cornerRadius = cornerRadius
    }
  }

  @IBInspectable var insetX: CGFloat = 16
  @IBInspectable var insetY: CGFloat = 0

  @IBInspectable var rightIcon: UIImage? {
    didSet {
      setupRightIcon()
    }
  }

  @IBInspectable var leftIcon: UIImage? {
    didSet {
      setupLeftIcon()
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    afterInit()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override func awakeFromNib() {
    super.awakeFromNib()
    afterInit()
  }

  func afterInit() {
    font = UIFont.systemFont(ofSize: 16)
    textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5959706764)
    addTarget(self, action: #selector(textFieldBeginEditing(_:)), for: .editingDidBegin)
    addTarget(self, action: #selector(textFieldEndEditing(_:)), for: .editingDidEnd)
  }

  override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.insetBy(dx: insetX, dy: insetY)
  }

  override func textRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.insetBy(dx: insetX, dy: insetY)
  }

  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.insetBy(dx: insetX, dy: insetY)
  }
}

// MARK: - event listener

private extension FormTextField {
  func setupRightIcon() {
    guard rightIcon != nil else { return }
    rightView = UIImageView(image: rightIcon)
    rightViewMode = .always
  }

  func setupLeftIcon() {
    guard leftIcon != nil else { return }
    leftView = UIImageView(image: leftIcon)
    leftViewMode = .always
  }
}

extension FormTextField {
  @objc func textFieldBeginEditing(_ textField: UITextField) {
    layer.borderColor = activeBorderColour.cgColor
  }

  @objc func textFieldEndEditing(_ textField: UITextField) {
    layer.borderColor = borderColour.cgColor
  }
}
