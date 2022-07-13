//
//  UIImage+Data.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2021 Huxley. All rights reserved.
//  

import Foundation
import UIKit

extension UIImage {
  var looselyCompressedJpegData: Data? {
    jpegData(compressionQuality: 1)
  }
}
