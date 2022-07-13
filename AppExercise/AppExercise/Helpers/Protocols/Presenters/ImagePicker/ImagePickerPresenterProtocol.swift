//
//  ImagePickerPresenterProtocol.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//  

import Foundation
import UIKit

protocol ImagePickerPresenterProtocol {
  var onImagesPick: SingleResult<[UIImage]>? { get set }
  var onError: SingleResult<Error>? { get set }
  
  var anchorController: UIViewController? { get set }
  
  func presentPicker()
  
  func presentPicker(maxNumberOfItems: Int)
}
