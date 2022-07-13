//
//  MockPageContentViewModel.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation
import UIKit

@testable import AppExercise

class MockPageContentViewModel: PageContentViewModelProtocol {
  var title: String = ""
  var description: String = ""
  var image: UIImage = UIImage()

  var titleColor: UIColor = .clear
  var descriptionColor: UIColor = .clear
  var imageBackgroundColor: UIColor = .clear

  var imageContentMode: UIView.ContentMode = .bottom
  var imageClipsToBounds: Bool = false
}
