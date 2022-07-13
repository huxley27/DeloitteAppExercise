//
//  NibLoadable.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import UIKit

protocol NibLoadable where Self: UIView {
  var contentView: UIView! { get }
}

extension NibLoadable {
  func loadNib(named nibName: String? = nil) {
    let nib = nibName ?? String(describing: type(of: self))
    Bundle.main.loadNibNamed(nib, owner: self, options: nil)
    addSubview(contentView)
    contentView.autoPinEdgesToSuperviewEdges()
  }
}
