//
//  PageContentController.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import PureLayout
import UIKit

class PageContentController: ViewController {
  var viewModel: PageContentViewModelProtocol!

  @IBOutlet private(set) var bgTopPaddingView: UIView!
  @IBOutlet private(set) var backgroundView: UIView!
  @IBOutlet private(set) var imageView: UIImageView!
  @IBOutlet private(set) var titleLabel: UILabel!
  @IBOutlet private(set) var descriptionLabel: UILabel!

  private let descriptionMargin: CGFloat = 55
  private let titleBottomPadding: CGFloat = 24

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }

  private func setupView() {
    guard viewModel != nil else { return }

    titleLabel.text = viewModel.title
    titleLabel.textColor = viewModel.titleColor
    descriptionLabel.text = viewModel.description
    descriptionLabel.textColor = viewModel.descriptionColor
    descriptionLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: titleBottomPadding)
    descriptionLabel.autoPinEdge(
      toSuperviewSafeArea: .left,
      withInset: descriptionMargin
    )
    descriptionLabel.autoPinEdge(
      toSuperviewSafeArea: .right,
      withInset: descriptionMargin
    )
    view.layoutIfNeeded()

    imageView.image = viewModel.image
    imageView.contentMode = viewModel.imageContentMode
    imageView.clipsToBounds = viewModel.imageClipsToBounds

    backgroundView.backgroundColor = viewModel.imageBackgroundColor
    bgTopPaddingView.backgroundColor = viewModel.imageBackgroundColor
  }
}
