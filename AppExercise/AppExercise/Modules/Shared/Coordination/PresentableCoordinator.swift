//
//  PresentableCoordinator.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import UIKit

public protocol PresentableCoordinator: Coordinator {
    func present(over presentingViewController: UIViewController, animated: Bool, completion: (() -> Void)?)
    /* weak */ var presentingCoordinator: PresentingCoordinator? { get set }
}
