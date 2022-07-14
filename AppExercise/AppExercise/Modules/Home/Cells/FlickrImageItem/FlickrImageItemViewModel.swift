//
//  FlickrImageItemViewModel.swift
//  AppExercise
//
//  Created by HUXLEY ALCAIN on 7/14/22.
//  Copyright © 2022 Huxley. All rights reserved.
//

import UIKit

class FlickrImageItemViewModel {
  
  private let flickrItem: FlickrItem
  
  init(flickrItem: FlickrItem) {
    self.flickrItem = flickrItem
  }
}

// MARK: - Getters

extension FlickrImageItemViewModel: FlickrImageItemViewModelProtocol {
  var flickItemImageUrl: URL? {
    URL(string: "")
  }
  
  var flickItemPlaceholderImage: UIImage? {
    R.image.thumbnailPlaceholder()
  }
}
