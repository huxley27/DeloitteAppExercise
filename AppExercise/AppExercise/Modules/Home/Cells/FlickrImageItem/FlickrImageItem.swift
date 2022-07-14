//
//  FlickrImageItem.swift
//  AppExercise
//
//  Created by HUXLEY ALCAIN on 7/14/22.
//  Copyright © 2022 Huxley. All rights reserved.
//

import Foundation
import UIKit

class FlickrImageItem: UICollectionViewCell {
  var viewModel: FlickrImageItemViewModelProtocol! {
    didSet {
      setupFromViewModel()
    }
  }
  
  @IBOutlet weak private(set) var imageView: UIImageView!
}

// MARK: - Setup

private extension FlickrImageItem {
  func setupFromViewModel() {
    imageView.setImageWithURL(
      viewModel.flickItemImageUrl,
      placeholder: viewModel.flickItemPlaceholderImage,
      onSuccess: onImageDownloadSuccess(),
      onError: onImageDownloadError()
    )
  }
}

// MARK: - Handlers

private extension FlickrImageItem {
  func onImageDownloadSuccess() -> SingleResult<UIImage> {
    return { [weak self] image in
      guard let self = self else { return }
      self.imageView.image = image
    }
  }
  
  func onImageDownloadError() -> SingleResult<Error> {
    return { error in
      print(error)
    }
  }
}
