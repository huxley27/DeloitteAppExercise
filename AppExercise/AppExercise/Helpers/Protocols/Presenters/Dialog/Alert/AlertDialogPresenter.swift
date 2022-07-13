//
//  AlertDialogPresenter.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation
import UIKit

class AlertDialogPresenter: DialogPresenterProtocol {
  func presentDialog(
    _ dialog: DialogProtocol,
    from source: UIViewController
  ) {
    let alert = UIAlertController(
      title: dialog.title,
      message: dialog.message,
      preferredStyle: .alert
    )

    if let cancelOption = dialog.cancelOption {
      addAlertAction(
        to: alert,
        from: cancelOption,
        style: .cancel
      )
    }

    if let denyOption = dialog.negativeOption {
      addAlertAction(
        to: alert,
        from: denyOption,
        style: .destructive
      )
    }
    
    if let affirmOption = dialog.positiveOption {
      addAlertAction(
        to: alert,
        from: affirmOption,
        style: .default
      )
    }

    source.present(alert, animated: true)
  }
}

// MARK: - Utils

private extension AlertDialogPresenter {
  func addAlertAction(
    to alert: UIAlertController,
    from option: DialogOption,
    style: UIAlertAction.Style
  ) {
    let action = UIAlertAction(
      title: option.title,
      style: style,
      handler: { _ in option.onSelect() }
    )
    
    alert.addAction(action)

    if option.isPreferred {
      alert.preferredAction = action
    }
  }
}
