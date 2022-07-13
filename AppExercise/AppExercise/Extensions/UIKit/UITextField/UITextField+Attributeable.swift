//
//  UITextField+Attributeable.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import UIKit

extension UITextField: Attributeable {
  func applyAttribute(_ attribute: TextFieldAttributeType) {
    attribute.apply(to: self)
  }
}

enum TextFieldAttributeType: ViewAttributeType {
  case username, email, phoneNumber, fullname, givenName
  case oneTimePasscode, password
  case properNoun, commonNoun
  case monetary

  func apply(to textField: UITextField) {
    switch self {
    case .username: usernameAttribute(textField)
    case .email: emailAttribute(textField)
    case .phoneNumber: phoneNumberAttribute(textField)
    case .fullname: fullnameAttribute(textField)
    case .givenName: givenNameAttribute(textField)
    case .oneTimePasscode: oneTimePasscodeAttribute(textField)
    case .password: passwordAttribute(textField)
    case .properNoun: properNounAttribute(textField)
    case .commonNoun: commonNounAttribute(textField)
    case .monetary: monetaryAttribute(textField)
    }
  }
}

private extension TextFieldAttributeType {
  func emailAttribute(_ textField: UITextField) {
    textField.autocapitalizationType = .none
    textField.autocorrectionType = .no
    textField.keyboardType = .emailAddress
    textField.textContentType = .emailAddress
  }

  func phoneNumberAttribute(_ textField: UITextField) {
    textField.keyboardType = .phonePad
    textField.textContentType = .telephoneNumber
  }

  func fullnameAttribute(_ textField: UITextField) {
    properNounAttribute(textField)
    textField.textContentType = .name
  }

  func givenNameAttribute(_ textField: UITextField) {
    properNounAttribute(textField)
    textField.textContentType = .givenName
  }

  func oneTimePasscodeAttribute(_ textField: UITextField) {
    textField.autocapitalizationType = .none
    textField.autocorrectionType = .yes
    textField.keyboardType = .numberPad
    if #available(iOS 13, *) {
      textField.textContentType = .oneTimeCode
    }
  }

  func passwordAttribute(_ textField: UITextField) {
    textField.autocapitalizationType = .none
    textField.autocorrectionType = .no
    textField.keyboardType = .default
    textField.textContentType = .password
  }

  func properNounAttribute(_ textField: UITextField) {
    textField.autocapitalizationType = .words
    textField.autocorrectionType = .no
    textField.keyboardType = .alphabet
    textField.textContentType = .name
  }

  func commonNounAttribute(_ textField: UITextField) {
    textField.autocapitalizationType = .sentences
    textField.autocorrectionType = .yes
    textField.keyboardType = .alphabet
  }

  func monetaryAttribute(_ textField: UITextField) {
    textField.autocapitalizationType = .none
    textField.autocorrectionType = .no
    textField.keyboardType = .decimalPad
  }

  func usernameAttribute(_ textField: UITextField) {
    textField.autocapitalizationType = .none
    textField.autocorrectionType = .no
    textField.textContentType = .username
  }
}
