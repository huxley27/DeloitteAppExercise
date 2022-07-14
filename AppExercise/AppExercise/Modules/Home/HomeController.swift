//
//  HomeController.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2021 Huxley. All rights reserved.
//  

import Foundation
import UIKit

import RxCocoa
import RxSwift
import Blueprints

class HomeController: CollectionViewController {
  var viewModel: HomeViewModelProtocol!
  
  @IBOutlet weak private(set) var searchBar: UISearchBar!
}

// MARK: - Lifecycle

extension HomeController {
  override func viewDidLoad() {
    super.viewDidLoad()

    let blueprintLayout = VerticalBlueprintLayout(
      itemsPerRow: 3,
      height: 100,
      minimumInteritemSpacing: 8,
      minimumLineSpacing: 8,
      sectionInset: EdgeInsets(top: 10, left: 10, bottom: 10, right: 10),
      stickyHeaders: false,
      stickyFooters: false
    )

    collectionView?.collectionViewLayout = blueprintLayout
    
    setup()
    bind()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    // Note: Hiding of navbar is for demo purposes only
    navigationController?.setNavigationBarHidden(true, animated: false)
  }
}

// MARK: - Setup

private extension HomeController {
  func setup() {
    self.navigationController?.setNavigationBarHidden(true, animated: true)
    registerCell()
    setupCollectionView()
  }
  
  func registerCell() {
    collectionView?.delegate = self
    collectionView?.dataSource = self
    collectionView?.register(
      UINib(resource: R.nib.flickrImageItem),
      forCellWithReuseIdentifier: R.nib.flickrImageItem.name
    )
  }
}

// MARK: - Bindings

private extension HomeController {
  func bind() {
    bindSearchBar()
    updateCollectionViewHandler()
  }
  
  func updateCollectionViewHandler() {
    onPaginateSwipeUp = handlePaginateSwipeUp()
    onRefreshPullDown = handleRefreshPullDown()
  }
  
  func bindSearchBar() {
    searchBar.rx.text.orEmpty
      .debounce(.seconds(1), scheduler: MainScheduler.instance)
      .distinctUntilChanged()
      .subscribe(onNext: handleSearchResult())
      .disposed(by: rx.disposeBag)
  }
}

// MARK: - Fetch Methods

private extension HomeController {
  func refreshImageFlickImageSearch() {
    progressPresenter.presentIndefiniteProgress(from: self)
    viewModel.refreshFlickrItems(
      query: searchBar.text,
      onSuccess: handleFetchResult(),
      onError: handleError()
    )
  }
  
  func getMoreFlickrImages() {
    viewModel?.getFlickrItems(
      query: searchBar.text,
      onSuccess: handleFetchResult(),
      onError: handleError()
    )
  }
}

// MARK: - Event Handlers

private extension HomeController {
  func handleSearchResult() -> SingleResult<String> {
    return { [weak self] queryText in
      guard let self = self else { return }
      
      self.progressPresenter.presentIndefiniteProgress(from: self)
      self.viewModel.refreshFlickrItems(
        query: queryText,
        onSuccess: self.handleFetchResult(),
        onError: self.handleError()
      )
    }
  }
  
  func handleRefreshPullDown() -> VoidResult {
    return { [weak self] in
      guard let self = self else { return }
      self.refreshImageFlickImageSearch()
    }
  }
  
  func handlePaginateSwipeUp() -> VoidResult {
    return { [weak self] in
      guard let self = self else { return }
      self.collectionViewVM.isLoading = true
      self.getMoreFlickrImages()
    }
  }
  
  func handleFetchResult() -> VoidResult {
    return { [weak self] in
      guard let self = self else { return }
      self.collectionView?.reloadData()
      self.collectionView?.layoutIfNeeded()
      self.collectionView?.scrollRectToVisible(CGRect.zero, animated: true)
      self.collectionViewVM.isLoading = false
      self.progressPresenter.dismiss()
    }
    
  }
}

// MARK: - CollectionView Delegates and Datasource
extension HomeController {
  
  override func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: R.nib.flickrImageItem.name,
      for: indexPath
    ) as? FlickrImageItem else { return FlickrImageItem() }
    
    let cellModel = viewModel.flickrImageItemViewModels[indexPath.row]
    cell.viewModel = cellModel
    
    return cell
  }

  override func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return viewModel.flickrImageItemViewModels.count
  }
  
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    return .init(
      width: view.frame.width,
      height: 100
    )
  }
}
