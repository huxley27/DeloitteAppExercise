//
//  PhoneCheckerController.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

import IQKeyboardManagerSwift
import MaterialComponents.MaterialTextFields
import NKVPhonePicker
import RxCocoa
import RxSwift
import SVProgressHUD

class PhoneCheckerController: ViewController {
  
  var viewModel: PhoneCheckerViewModel!
  
  @IBOutlet private weak var scrollContentView: UIView!
  @IBOutlet private weak var countryField: MDCTextField!
  @IBOutlet private weak var phoneField: MDCTextField!
  @IBOutlet private weak var primaryButton: MDCButton!
  
  private var nkvCountryCodeField: NKVPhonePickerTextField!
  private var countryInputController: MDCTextInputControllerUnderline!
  private var phoneInputController: MDCTextInputControllerUnderline!
  
}

// MARK: - View LifeCycle

extension PhoneCheckerController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
    setupBindings()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    navigationController?.setNavigationBarHidden(false, animated: animated)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    IQKeyboardManager.shared.shouldShowToolbarPlaceholder = true
  }
  
}

// MARK: - View Setups & Bindings

private extension PhoneCheckerController {
  
  func setupView() {
    setupCountryField()
    setupPhoneField()
    
    primaryButton.layer.cornerRadius = 8
  }
  
  func setupBindings() {
    bindTextField(countryField, to: viewModel.countryCode)
    bindTextField(phoneField, to: viewModel.phoneNumber)
  }
  
  func bindTextField(_ field: MDCTextField, to subject: BehaviorSubject<String>) {
    field.rx.text.orEmpty.asDriver().drive(subject).disposed(by: rx.disposeBag)
  }
  
  func setupCountryField() {
    countryInputController = MDCHelper.underlineInputController(for: countryField)
    
    let chevron = UIImageView(image: R.image.chevronDown()!)
    chevron.tintColor = Styles.Colors.Form.placeholderTextColor
    
    countryField.addSubview(chevron)
    chevron.autoSetDimensions(to: CGSize(width: 10, height: 7))
    chevron.autoPinEdge(toSuperviewEdge: .trailing)
    chevron.autoAlignAxis(toSuperviewAxis: .horizontal)
    
    countryField.isUserInteractionEnabled = false
    
    setupCountryCodePickerField()
  }
  
  func setupCountryCodePickerField() {
    nkvCountryCodeField = NKVPhonePickerTextField(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    nkvCountryCodeField.phonePickerDelegate = self
    nkvCountryCodeField.keyboardType = .phonePad
    nkvCountryCodeField.isHidden = true
    scrollContentView.addSubview(nkvCountryCodeField)
    
    // Catch all touches intended for TextField and route them to FlagView to trigger
    // the presentation of the picker screen.
    let maskButton = UIButton()
    scrollContentView.addSubview(maskButton)
    maskButton.autoMatch(.height, to: .height, of: countryField)
    maskButton.autoMatch(.width, to: .width, of: countryField)
    maskButton.autoAlignAxis(.horizontal, toSameAxisOf: countryField, withOffset: 0)
    maskButton.autoAlignAxis(.vertical, toSameAxisOf: countryField, withOffset: 0)
    
    let prefix: (String?) -> Void = { [unowned self] text in
      self.countryField.text = "+" + (text ?? "")
      self.viewModel.countryCode.onNext(text ?? "")
      if let flagIcon = self.nkvCountryCodeField.flagView.flagButton.imageView?.image {
        let padding: CGFloat = 8
        let flagIconSize: CGSize = CGSize(width: 30, height: 20)
        let outerView = UIView(frame: CGRect(x: 0,
                                             y: 0,
                                             width: padding + flagIconSize.width,
                                             height: flagIconSize.height))
        let imageView = UIImageView(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: flagIconSize.width,
                                                  height: flagIconSize.height))
        imageView.image = flagIcon
        outerView.addSubview(imageView)
        self.countryField.leftView = outerView
        self.countryField.leftViewMode = .unlessEditing
      }
    }
    prefix(nkvCountryCodeField.text)
    
    nkvCountryCodeField.rx
      .methodInvoked(#selector(setter: NKVPhonePickerTextField.text))
      .map { $0.first as? String }
      .subscribe(onNext: prefix)
      .disposed(by: rx.disposeBag)
    
    maskButton.rx
      .controlEvent(.touchUpInside)
      .subscribe(onNext: { [unowned self] _ in
        self.nkvCountryCodeField.flagView.flagButton.sendActions(for: .touchUpInside)
      })
      .disposed(by: rx.disposeBag)
  }
  
  func setupPhoneField() {
    phoneField.autocorrectionType = .no
    phoneField.textContentType = .telephoneNumber
    phoneField.keyboardType = .phonePad
    phoneField.delegate = self
    
    phoneInputController = MDCHelper.underlineInputController(for: phoneField)
    
    phoneField.becomeFirstResponder()
  }
  
}

// MARK: - Actions

extension PhoneCheckerController {
  
  @IBAction
  func continueButtonTapped(_ sender: AnyObject) {
    guard viewModel.validatePhoneNumber() else { return }
    
    SVProgressHUD.show()
    
    viewModel.process()
      .subscribe(
        onSuccess: { [weak self] isAvailable in
          SVProgressHUD.dismiss()
          guard let slf = self else { return }

          if !isAvailable {
            let vc = R.storyboard.authLogin.loginFormController()!
            vc.viewModel = LoginFormViewModel(
              code: slf.viewModel.countryCodeValue,
              phone: slf.viewModel.phoneNumberValue
            )
            slf.navigationController?.pushViewController(vc, animated: true)
          } else {
            let vc = R.storyboard.authSignup.registrationPasswordController()!
            vc.viewModel = RegistrationPasswordViewModel(
              code: slf.viewModel.countryCodeValue,
              phone: slf.viewModel.phoneNumberValue
            )
            slf.navigationController?.pushViewController(vc, animated: true)
          }

        }, onError: { error in
          SVProgressHUD.showDismissableError(with: error.localizedDescription)
        }
      )
      .disposed(by: rx.disposeBag)
  }
}

// MARK: - UITextFieldDelegate

extension PhoneCheckerController: UITextFieldDelegate {
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    guard !textField.text.isNilOrEmpty else { return false }
    
    if textField == phoneField {
      perform(#selector(continueButtonTapped(_:)), with: self)
    }
    
    return true
  }
}
