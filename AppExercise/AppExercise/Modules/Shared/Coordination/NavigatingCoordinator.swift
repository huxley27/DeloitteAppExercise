//
//  NavigatingCoordinator.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import UIKit

public protocol NavigatingCoordinator: Coordinator {
    func setCoordinators(_ coordinators: [NavigableCoordinator], animated: Bool)
}
