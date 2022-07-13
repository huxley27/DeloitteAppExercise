//
//  ScrollViewController.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2019 Huxley. All rights reserved.
//

import PureLayout
import UIKit

class ScrollViewController: ViewController {
  @IBOutlet var scrollView: UIScrollView!
  @IBOutlet var contentView: UIView!

  /// When set to True, we set `UINavigationController`s `hidesBarsOnSwipe` on this class'
  /// `viewWillAppear(_)` method to True as well, then later disable it on `viewWillDisappear(_)`.
  /// So you can take advantage of the WebView-style bar-hiding when user scrolls your content.
  /// Defaults to False.
  var prefersHidingBarsOnSwipe: Bool {
    return false
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    if contentView.superview == nil {
      scrollView.addSubview(contentView)
      contentView.autoPinEdgesToSuperviewEdges()
      contentView.autoMatch(.width, to: .width, of: view)
    }
    if scrollView.superview == nil {
      view.addSubview(scrollView)
      scrollView.autoPinEdgesToSuperviewEdges()
    }

    scrollView.alwaysBounceVertical = true
    scrollView.keyboardDismissMode = .interactive
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    if prefersHidingBarsOnSwipe {
      navigationController?.hidesBarsOnSwipe = true
    }
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)

    if prefersHidingBarsOnSwipe {
      navigationController?.hidesBarsOnSwipe = false
    }
  }
}
