//
//  FlickrImageItem.swift
//  AppExercise
//
//  Created by HUXLEY ALCAIN on 7/14/22.
//  Copyright © 2022 Huxley. All rights reserved.
//

import Foundation
import UIKit
import ImageViewer_swift
import SDWebImage

class FlickrImageItem: UICollectionViewCell {
  var viewModel: FlickrImageItemViewModelProtocol! {
    didSet {
      setupFromViewModel()
    }
  }
  
  @IBOutlet private(set) var container: UIView!
  @IBOutlet private(set) var imageView: UIImageView!
  
  // MARK: Overrides

  override func awakeFromNib() {
    setup()
  }
}

// MARK: - Setup

private extension FlickrImageItem {
  func setup() {
    container.layer.cornerRadius = 8
  }
  
  func setupFromViewModel() {
    guard let url = viewModel.flickItemImageUrl else { return }
    
    container.backgroundColor = .white
    imageView.setImageWithURL(
      url,
      placeholder: viewModel.flickItemPlaceholderImage,
      onSuccess: onImageDownloadSuccess(),
      onError: onImageDownloadError()
    )

    // TODO: Extract logic outside of this cell
    imageView.setupImageViewer(url: url)
  }
}

// MARK: - Handlers

private extension FlickrImageItem {
  func onImageDownloadSuccess() -> SingleResult<UIImage> {
    return { [weak self] image in
      guard let self = self else { return }
      self.imageView.image = image
      self.container.backgroundColor = .black
    }
  }
  
  func onImageDownloadError() -> SingleResult<Error> {
    return { error in
      print(error)
    }
  }
}
