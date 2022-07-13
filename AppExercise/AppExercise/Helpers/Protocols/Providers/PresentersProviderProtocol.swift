//
//  PresentersProviderProtocol.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//  

import Foundation
import UIKit

protocol PresentersProviderProtocol {
  var progressPresenter: ProgressPresenterProtocol { get }
  var dialogPresenter: DialogPresenterProtocol { get }
  var infoPresenter: InfoPresenterProtocol { get }
}
