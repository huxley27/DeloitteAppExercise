//
//  RootCoordinator.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import UIKit

/// A coordinator that provides a root view controller
public protocol RootCoordinator: Coordinator {
    /// The root view controller for this coordinator
    var rootViewController: UIViewController { get }
}
