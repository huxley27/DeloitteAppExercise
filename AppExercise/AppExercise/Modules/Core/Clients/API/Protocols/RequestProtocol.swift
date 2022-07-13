//
//  RequestProtocol.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Alamofire
import Foundation

protocol RequestProtocol {
  func resume()
  func suspend()
  func cancel()
}

extension DataRequest: RequestProtocol {}
