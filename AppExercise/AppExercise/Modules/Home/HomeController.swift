//
//  HomeController.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2021 Huxley. All rights reserved.
//  

import Foundation
import UIKit

import RxCocoa
import RxSwift

class HomeController: ViewController {
  var viewModel: HomeViewModelProtocol!
  
  // @IBOutlet private(set) var label: UILabel!
  // @IBOutlet private(set) var field: APTextField!
  
  // private(set) var fieldInputController: MDCInputControllerBase!
}

// MARK: - Lifecycle

extension HomeController {
  override func viewDidLoad() {
    super.viewDidLoad()

    setup()
    bind()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    // Note: Hiding of navbar is for demo purposes only
    navigationController?.setNavigationBarHidden(true, animated: false)
  }
}

// MARK: - Setup

private extension HomeController {
  func setup() {

  }
}

// MARK: - Bindings

private extension HomeController {
  func bind() {

  }
}

// MARK: - Router

private extension HomeController {
//  func presentSomeController() {
//    let vc = R.storyboard.someController.SomeController()!
//    vc.viewModel = SomeViewModel()
//    navigationController?.pushViewController(vc, animated: true)
//  }
}

// MARK: - Actions

private extension HomeController {
//  @IBAction
//  func someButtonTapped(_ sender: Any) {
//    viewModel.someFunction2(
//      param1: 0,
//      param2: "",
//      onSuccess: handleSomeSuccess(),
//      onError: handleError()
//    )
//  }
}

// MARK: - Event Handlers

private extension HomeController {
//  func handleSomeSuccess() -> VoidResult {
//    return { [weak self] in
//      guard let s = self else { return }
//      // TODO: Do something here
//    }
//  }
}

// MARK: - Helpers

private extension HomeController {

}

// MARK: - SomeControllerProtocol

//extension HomeController: SomeControllerProtocol {
//
//}
