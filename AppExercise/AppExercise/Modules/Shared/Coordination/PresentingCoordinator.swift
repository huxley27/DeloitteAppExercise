//
//  PresentingCoordinator.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import UIKit

public protocol PresentingCoordinator: Coordinator {
    var presentationContext: UIViewController? { get }
}

public extension PresentingCoordinator {
    /// Present a view controller
    ///
    /// - Parameters:
    ///   - coordinatorToPresent: A coordinator to present the view controller
    ///   - animated: Pass true to animate the presentation otherwise pass false
    ///   - completion: The block to execute after the presentation finishes
    func present(_ coordinatorToPresent: PresentableCoordinator, animated: Bool, completion: (() -> Void)? = nil) {
        guard let presentationContext = presentationContext else {
            return
        }

        coordinatorToPresent.present(over: presentationContext, animated: animated, completion: completion)
        coordinatorToPresent.presentingCoordinator = self
    }

    /// Dismiss the view controller that was presented
    ///
    /// - Parameters:
    ///   - animated: Pass true to animate the transition otherwise pass false
    ///   - completion: The block to execute after the view controller is dismissed
    func dismiss(animated: Bool, completion: (() -> Void)? = nil) {
        presentationContext?.dismiss(animated: animated, completion: completion)
    }
}

public extension PresentingCoordinator {
    /// Present an alert
    ///
    /// - Parameters:
    ///   - alert: The alert controller to be presented
    ///   - animated: Pass true to animate the presentation otherwise pass false
    ///   - completion: The block to execute after the presentation finishes
    func present(_ alert: UIAlertController, animated: Bool, completion: (() -> Void)? = nil) {
        guard let presentationContext = presentationContext else {
            return
        }

        presentationContext.present(alert, animated: animated, completion: completion)
    }
}
