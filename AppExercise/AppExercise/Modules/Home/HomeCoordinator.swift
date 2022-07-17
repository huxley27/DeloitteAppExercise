//
//  HomeCoordinator.swift
//  AppExercise
//
//  Created by HUXLEY ALCAIN on 7/17/22.
//  Copyright © 2022 Huxley. All rights reserved.
//

import Foundation
import UIKit

protocol HomeCoordinatorDelegate: AnyObject {
  func memberCardCoordinatorCloseButtonTapped(_ coordinator: HomeCoordinator)
}

class HomeCoordinator: Coordinator {
  init(service: FlickrSearchServiceProtocol) {
    self.service = service
  }
  
  weak var presentingCoordinator: PresentingCoordinator?
  
  private var service: FlickrSearchServiceProtocol
  
  weak var delegate: HomeCoordinatorDelegate?
  
  weak var _viewController: HomeController?
  var viewController: HomeController {
    if let viewController = _viewController {
      return viewController
    }
    
    let viewController = createViewController()
    _viewController = viewController
    return viewController
  }
  
  func createViewController() -> HomeController {
    guard let viewController = R.storyboard.home.homeController() else {
      preconditionFailure("Expecting viewController of type ViewController")
    }
    viewController.hidesBottomBarWhenPushed = true
    viewController.viewModel = HomeViewModel()
    viewController.collectionViewVM = CollectionViewModel()
    viewController.coordinator = self
    
    return viewController
  }
}

extension HomeCoordinator: HomeControllerDelegate {
  // Insert Here Home Controller Delegate Methods
  // if you want coordinator to do something about it
}

extension HomeCoordinator: PresentingCoordinator {
  var presentationContext: UIViewController? {
    return viewController
  }
}

extension HomeCoordinator: PresentableCoordinator {
  /// Present this coordinator's rootViewController modally
  ///
  /// - Parameters:
  ///   - viewController: the view controller to present over
  ///   - animated: whether to animate the presentation
  ///   - completion: closure executed upon completion
  func present(over presentingViewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
    presentingViewController.present(viewController, animated: animated, completion: completion)
  }
}
