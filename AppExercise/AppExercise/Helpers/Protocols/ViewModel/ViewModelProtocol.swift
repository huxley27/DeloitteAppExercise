//
//  ViewModelProtocol.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//  

import Foundation

import NSObject_Rx

protocol ViewModelProtocol: TriggerableProtocol, HasDisposeBag {
  var onRefresh: VoidResult? { get set }
}
