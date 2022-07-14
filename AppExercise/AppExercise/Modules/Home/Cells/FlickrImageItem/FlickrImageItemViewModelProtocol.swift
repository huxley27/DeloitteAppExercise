//
//  FlickrImageItemViewModelProtocol.swift
//  AppExercise
//
//  Created by HUXLEY ALCAIN on 7/14/22.
//  Copyright © 2022 Huxley. All rights reserved.
//

import Foundation
import UIKit

protocol FlickrImageItemViewModelProtocol {
  var flickItemImageUrl: URL? { get }
  var flickItemPlaceholderImage: UIImage? { get }
}
