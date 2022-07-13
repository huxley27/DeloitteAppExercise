//
//  VerticalStackViewController.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2019 Huxley. All rights reserved.
//

import PureLayout
import UIKit

class VerticalStackController: ScrollViewController {
  @IBOutlet var stackView: UIStackView!

  var stackViewInsets: UIEdgeInsets {
    return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
  }

  var stackViewSpacing: CGFloat {
    return 16
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    if stackView == nil {
      // FIXME: Instance will be immediately deallocated because property 'stackView' is 'weak'
      stackView = UIStackView()
      stackView.axis = .vertical
      stackView.alignment = .fill
      stackView.distribution = .fill
      stackView.spacing = stackViewSpacing
      stackView.setContentHuggingPriority(UILayoutPriority(250), for: .horizontal)
    }
    if stackView.superview == nil {
      contentView.addSubview(stackView)
      let insets = stackViewInsets
      stackView.autoPinEdgesToSuperviewEdges(with: insets, excludingEdge: .bottom)
      stackView.autoPinEdge(toSuperviewEdge: .bottom, withInset: insets.bottom, relation: .greaterThanOrEqual)
    }
  }
}
