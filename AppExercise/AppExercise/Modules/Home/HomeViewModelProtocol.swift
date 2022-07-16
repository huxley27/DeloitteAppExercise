//
//  HomeViewModelProtocol.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2021 Huxley. All rights reserved.
//  

import Foundation

protocol HomeViewModelProtocol {
  var flickrImageItemViewModels: [FlickrImageItemViewModelProtocol] { get }
  var flickrItems: [FlickrItem] { get }
  var hasFetchedAllFlickrImages: Bool { get }
  
  func fetchRecentFlickrImages(
    onSuccess: @escaping VoidResult,
    onError: @escaping ErrorResult
  )
  
  func searchFlickrImages(
    with query: String,
    onSuccess: @escaping VoidResult,
    onError: @escaping ErrorResult
  )
  
  func resetToFirstPage()
}
