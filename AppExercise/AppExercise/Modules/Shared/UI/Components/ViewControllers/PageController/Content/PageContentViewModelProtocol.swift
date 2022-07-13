//
//  PageContentViewModelProtocol.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import UIKit

protocol PageContentViewModelProtocol {
  var title: String { get }
  var description: String { get }
  var image: UIImage { get }
  
  var titleColor: UIColor { get }
  var descriptionColor: UIColor { get }
  var imageBackgroundColor: UIColor { get }
  
  var imageContentMode: UIView.ContentMode { get }
  var imageClipsToBounds: Bool { get }
}

// MARK: - Defaults

extension PageContentViewModelProtocol {
  var titleColor: UIColor { .black }
  var descriptionColor: UIColor { .black }
  var imageBackgroundColor: UIColor { .white }
  
  var imageContentMode: UIView.ContentMode { .scaleAspectFit }
  var imageClipsToBounds: Bool { true }
}
