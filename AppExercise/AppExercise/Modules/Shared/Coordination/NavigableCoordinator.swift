//
//  NavigableCoordinator.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import UIKit

public protocol NavigableCoordinator: Coordinator {
    var viewController: UIViewController { get }
}
