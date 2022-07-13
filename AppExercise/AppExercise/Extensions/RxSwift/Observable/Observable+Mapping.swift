//
//  Observable+Mapping.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//  

import Foundation

import RxSwift

extension Observable {
  func mapToVoid() -> Observable<Void> {
    return map(to: Void())
  }
  
  func map<T>(to value: T) -> Observable<T> {
    return map { _ in value }
  }
}
