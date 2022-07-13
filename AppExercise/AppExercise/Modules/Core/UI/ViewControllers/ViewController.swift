//
//  ViewController.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2018 Huxley. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PresentersProviderProtocol {
  lazy var progressPresenter: ProgressPresenterProtocol = HUDProgressPresenter()
  lazy var dialogPresenter: DialogPresenterProtocol = AlertDialogPresenter()
  lazy var infoPresenter: InfoPresenterProtocol = SnackbarInfoPresenter()
  
  enum CloseButtonPosition {
    case left
    case right
  }

  /// Close button's position when this controller is presented modally. Defaults to `left`.
  var preferredCloseButtonPosition: CloseButtonPosition {
    return .left
  }
  
  var shouldSetNavBarTransparent: Bool {
    return false
  }

  var viewWillAppearCallCount: Int {
    return _viewWillAppearCallCount
  }

  private var _viewWillAppearCallCount = 0

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = R.color.backgroundLight()!
    setupNavBarItems()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    _viewWillAppearCallCount += 1
    
    if shouldSetNavBarTransparent {
      navigationController?.navigationBar.setTransparent()
    }
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    if shouldSetNavBarTransparent {
      navigationController?.navigationBar.setNonTransparent()
    }
  }

  /// A place for adding your custom navigation bar buttons.
  ///
  /// By default, a custom **Back** button will appear on the left side of the navigation bar
  /// if this controller isn't the root of its `navigationController`. On the other hand,
  /// if it's presented modally, we show a **Close** button.
  ///
  /// This method is called inside `viewDidLoad`.
  ///
  func setupNavBarItems() {
    if navigationController?.viewControllers.first != self {
      let backButton = UIBarButtonItem(
        image: R.image.arrowLeftBlack(),
        style: .plain,
        target: self,
        action: #selector(backButtonTapped(_:))
      )
      // TODO: Color should be from Theme/Styles
      backButton.tintColor = .black
      navigationItem.leftBarButtonItem = backButton

      // Fix for bug where swiping from left to right to go back is gone.
      // The bug is the side effect for setting custom `leftBarButtonItem`.
      navigationController?.interactivePopGestureRecognizer?.delegate = self
    } else if isPresentedModally {
      let button = UIBarButtonItem(
        image: R.image.xClose(),
        style: .plain,
        target: self,
        action: #selector(backButtonTapped(_:))
      )
      if preferredCloseButtonPosition == .left {
        navigationItem.leftBarButtonItem = button
      } else {
        navigationItem.rightBarButtonItem = button
      }
    }
  }

  @IBAction
  func backButtonTapped(_ sender: AnyObject) {
    if navigationController?.viewControllers.first != self {
      navigationController?.popViewController(animated: true)
    } else if isPresentedModally {
      dismiss(animated: true, completion: nil)
    }
  }
}

// MARK: - UIGestureRecognizerDelegate

extension ViewController: UIGestureRecognizerDelegate {
  func gestureRecognizer(
    _ gestureRecognizer: UIGestureRecognizer,
    shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer
  ) -> Bool {
    return true
  }
}

// MARK: - HandlersProviderProtocol

extension ViewController: HandlersProviderProtocol {}
