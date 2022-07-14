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
  func getFlickrItems(
    query: String?,
    onSuccess: @escaping VoidResult,
    onError: @escaping ErrorResult
  ) {
    guard
      let query = query,
      !hasFetchedAllFlickrImages
    else {
      return
    }
    
    let params = FlickrSearchRequestParam(
      method: "flickr.photos.search",
      apiKey: config.apiKey,
      text: query,
      format: "json",
      noJsonCallback: "1",
      page: page.index,
      perPage: page.size
    )
    
    service.getImageSearch(
      params: params,
      onSuccess: { [weak self] flickrPhotos in
        guard let self = self else { return }
        
        if self.page.index == 1 {
          self.flickrImageItemViewModels.removeAll()
          self.flickrItems.removeAll()
        }
        self.page = APIPage(index: self.page.index + 1, size: self.page.size)
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
  
  func refreshFlickrItems(
    query: String?,
    onSuccess: @escaping VoidResult,
    onError: @escaping ErrorResult
  ) {
    hasFetchedAllFlickrImages = false
    page = APIPage(index: 1, size: page.size)
    getFlickrItems(
      query: query,
      onSuccess: onSuccess,
      onError: onError
    )
  }
}
