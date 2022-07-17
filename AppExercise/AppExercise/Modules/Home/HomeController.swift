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
    setupCollectionViewLayout(forEmptyState: true)
  }
  
  func registerCell() {
    collectionView?.delegate = self
    collectionView?.dataSource = self
    collectionView?.register(
      UINib(resource: R.nib.flickrImageItem),
      forCellWithReuseIdentifier: R.nib.flickrImageItem.name
    )
    collectionView?.register(
      UINib(resource: R.nib.emptyStateItem),
      forCellWithReuseIdentifier: R.nib.emptyStateItem.name
    )
  }
  
  func setupCollectionViewLayout(forEmptyState: Bool = false) {
    let blueprintLayout = VerticalBlueprintLayout(
      itemsPerRow: forEmptyState ? 1 : 3,
      height: 100,
      minimumInteritemSpacing: 8,
      minimumLineSpacing: 8,
      sectionInset: EdgeInsets(top: 10, left: 10, bottom: 10, right: 10),
      stickyHeaders: false,
      stickyFooters: false
    )

    collectionView?.collectionViewLayout = blueprintLayout
    collectionView?.isScrollEnabled = !forEmptyState
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
      .debounce(.milliseconds(500), scheduler: MainScheduler.instance)
      .distinctUntilChanged()
      .subscribe(onNext: handleSearchResult())
      .disposed(by: rx.disposeBag)
  }
}

// MARK: - Fetch Methods

private extension HomeController {
  func refreshImageFlickImageSearch() {
    viewModel.resetToFirstPage()
    getFlickrImages(query: searchBar.text)
  }
  
  func getFlickrImages(query: String? = nil) {
    progressPresenter.presentIndefiniteProgress(from: self)
    if let query = query, !query.isEmpty {
      viewModel?.searchFlickrImages(
        with: query,
        onSuccess: handleFetchResult(),
        onError: handleError()
      )
    } else {
      viewModel.fetchRecentFlickrImages(
        onSuccess: handleFetchResult(),
        onError: handleError()
      )
    }
  }
}

// MARK: - Event Handlers

private extension HomeController {
  func handleSearchResult() -> SingleResult<String> {
    return { [weak self] queryText in
      guard let self = self else { return }
      self.viewModel.resetToFirstPage()
      self.getFlickrImages(query: queryText)
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
      self.getFlickrImages(query: self.searchBar.text)
    }
  }
  
  func handleFetchResult() -> VoidResult {
    return { [weak self] in
      guard let self = self else { return }
      self.setupCollectionViewLayout(forEmptyState: self.viewModel.flickrImageItemViewModels.isEmpty)
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
    if viewModel.flickrImageItemViewModels.isEmpty {
      guard let cell = collectionView.dequeueReusableCell(
        withReuseIdentifier: R.nib.emptyStateItem.name,
        for: indexPath
      ) as? EmptyStateItem else { return EmptyStateItem() }
      return cell
    } else {
      guard let cell = collectionView.dequeueReusableCell(
        withReuseIdentifier: R.nib.flickrImageItem.name,
        for: indexPath
      ) as? FlickrImageItem else { return FlickrImageItem() }
      
      let cellModel = viewModel.flickrImageItemViewModels[indexPath.row]
      cell.viewModel = cellModel
      
      return cell
    }
  }

  override func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return viewModel.flickrImageItemViewModels.isEmpty ? 1 : viewModel.flickrImageItemViewModels.count
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    let height = viewModel.flickrImageItemViewModels.isEmpty ? view.frame.height - searchBar.frame.height - 100.0 : 100.0
    return .init(
      width: view.frame.width,
      height: height
    )
  }
}
