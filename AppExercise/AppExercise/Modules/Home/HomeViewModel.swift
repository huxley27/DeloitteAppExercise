//
//  HomeViewModel.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2021 Huxley. All rights reserved.
//  

import Foundation

class HomeViewModel: HomeViewModelProtocol {
  private let config: AppConfigProtocol = AppConfig()
  
  private(set) var flickrImageItemViewModels: [FlickrImageItemViewModelProtocol] = []

  private(set) var hasFetchedAllFlickrImages: Bool = false
  private var page: APIPage
  
  private(set) var flickrItems: [FlickrItem] = []
  private let service: FlickrSearchServiceProtocol
  
  init(
    page: APIPage = .default,
    service: FlickrSearchServiceProtocol = App.shared.flickr
  ) {
    self.page = page
    self.service = service
  }
}

// MARK: - Methods

extension HomeViewModel {
  func fetchRecentFlickrImages(
    onSuccess: @escaping VoidResult,
    onError: @escaping ErrorResult
  ) {
    let params = FlickrSearchRequestParam(
      method: .recent,
      apiKey: config.apiKey,
      text: nil,
      format: "json",
      noJsonCallback: "1",
      page: page.index,
      perPage: 20
    )
    getFlickrItems(params: params, onSuccess: onSuccess, onError: onError)
  }
  
  func searchFlickrImages(
    with query: String,
    onSuccess: @escaping VoidResult,
    onError: @escaping ErrorResult
  ) {
    let params = FlickrSearchRequestParam(
      method: .search,
      apiKey: config.apiKey,
      text: query,
      format: "json",
      noJsonCallback: "1",
      page: page.index,
      perPage: 20
    )
    getFlickrItems(params: params, onSuccess: onSuccess, onError: onError)
  }

  func resetToFirstPage() {
    hasFetchedAllFlickrImages = false
    page = APIPage(index: 1, size: page.size)
  }
  
  func getFlickrItems(
    params: FlickrSearchRequestParam,
    onSuccess: @escaping VoidResult,
    onError: @escaping ErrorResult
  ) {
    guard !hasFetchedAllFlickrImages else { return }
    
    service.getImageSearch(
      params: params,
      onSuccess: { [weak self] flickrPhotos in
        guard let self = self else { return }
        
        if self.page.index == 1 {
          self.flickrImageItemViewModels.removeAll()
          self.flickrItems.removeAll()
        }
        self.page = APIPage(index: flickrPhotos.page + 1, size: flickrPhotos.total)
        if flickrPhotos.photo.isEmpty {
          self.hasFetchedAllFlickrImages = true
        } else {
          self.flickrItems.append(contentsOf: flickrPhotos.photo)
          self.flickrImageItemViewModels.append(
            contentsOf: flickrPhotos.photo.map(
              { (flickItem) -> FlickrImageItemViewModelProtocol in
                FlickrImageItemViewModel(flickrItem: flickItem)
              }
            )
          )
        }
        onSuccess()
      },
      onError: onError
    )
  }
}
