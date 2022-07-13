//
//  VersionInfoView.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2021 Huxley. All rights reserved.
//

import Foundation
import UIKit

class VersionInfoView: BaseView, NibLoadable {
  var viewModel: VersionInfoViewModelProtocol! = VersionInfoViewModel() {
    didSet { refresh() }
  }

  @IBOutlet private(set) var contentView: UIView!
  @IBOutlet private(set) var versionLabel: APLabelFootnote!

  override func prepare() {
    loadNib()
    setup()
    refresh()
  }
}

// MARK: - Setup

private extension VersionInfoView {
  func setup() {
    backgroundColor = .clear
    contentView.backgroundColor = .clear
  }
}

// MARK: - Refresh

private extension VersionInfoView {
  func refresh() {
    versionLabel.text = viewModel.versionText
  }
}
