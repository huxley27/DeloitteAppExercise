//
//  EmptyStateItem.swift
//  AppExercise
//
//  Created by HUXLEY ALCAIN on 7/15/22.
//  Copyright © 2022 Huxley. All rights reserved.
//

import UIKit

class EmptyStateItem: UICollectionViewCell {
  @IBOutlet private(set) var containerView: UIView!

  override func awakeFromNib() {
    super.awakeFromNib()
    setup()
  }
}

// MARK: - Setup

private extension EmptyStateItem {
  func setup() {
//    containerView.setContainerAppearance()
//    containerView.addShadow()
  }
}
