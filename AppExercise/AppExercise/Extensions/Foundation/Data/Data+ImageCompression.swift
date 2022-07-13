//
//  Data+ImageCompression.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2021 Huxley. All rights reserved.
//

import Foundation
import UIKit

extension Data {
  func compressedImageData(quality: CGFloat) -> Data? {
    guard let image = UIImage(data: self) else {
      return nil
    }
    return image.jpegData(compressionQuality: quality)
  }

  func compressedImageData(quality: Float) -> Data? {
    compressedImageData(quality: CGFloat(quality))
  }
}

extension Array where Element == Data {
  func mapCompressedImageData(quality: CGFloat) -> [Data?] {
    map { $0.compressedImageData(quality: quality) }
  }

  func mapCompressedImageData(quality: Float) -> [Data?] {
    mapCompressedImageData(quality: CGFloat(quality))
  }
}
