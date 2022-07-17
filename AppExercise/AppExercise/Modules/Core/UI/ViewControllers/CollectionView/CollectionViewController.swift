//
//  CollectionViewController.swift
//  AirBabble
//
//  Created by HUXLEY ALCAIN on 7/14/22.
//  Copyright © 2022 Huxley. All rights reserved.
//

import UIKit

/// To match the design, In Storyboard:
/// Make sure to set the estimatedSize to Custom, width 185 and height 185
/// Make sure to set the Section Inset

///Please make sure to instantiate collectionViewVM when using this collectionView...see DashboardController below ProfileViewModel instantiation.
class ReusableHeader: UICollectionReusableView {}

class CollectionViewController: ViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
  
  var collectionViewVM: CollectionViewModelProtocol!
  @IBOutlet var collectionView: UICollectionView?
  
  var clearsSelectionOnViewWillAppear: Bool = true
  
  var onRefreshPullDown: VoidResult?
  var onPaginateSwipeUp: VoidResult?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    if clearsSelectionOnViewWillAppear {
      if let rows = collectionView?.indexPathsForSelectedItems {
        rows.forEach { indexPath in
          collectionView?.deselectItem(at: indexPath, animated: true)
        }
      }
    }
  }
}

// MARK: - Setup
extension CollectionViewController {
  func setupCollectionView() {
    collectionView?.refreshControl = UIRefreshControl()
    if let refreshControl = collectionView?.refreshControl {
      collectionView?.addSubview(refreshControl)
      refreshControl.addTarget(self, action: #selector(onCollectionViewRefresh), for: .valueChanged)
    }
  }
  
  @objc
  func onCollectionViewRefresh() {
    collectionView?.refreshControl?.endRefreshing()
    onRefreshPullDown?()
  }
}

// MARK: - CollectionView Delegates
extension CollectionViewController {
  // MARK: - UICollectionView DataSource
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    fatalError("collectionView(_:cellForItemAt:) is not implemented")
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    fatalError("collectionView(_:numberOfItemsInSection:) is not implemented")
  }
  
  func numberOfSections(
    in collectionView: UICollectionView
  ) -> Int {
    return 1
  }
  
  // MARK: - Collection View Datasource
  func collectionView(
    _ collectionView: UICollectionView,
    canEditItemAt indexPath: IndexPath
  ) -> Bool {
    return false
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    canMoveItemAt indexPath: IndexPath
  ) -> Bool {
    return false
  }
  
  // MARK: - UICollectionViewDelegateFlowLayout
}

// MARK: - ScrollView Delegate
extension CollectionViewController {
  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    let currentOffset = scrollView.contentOffset.y
    let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
    
    // Change 10.0 to adjust the distance from bottom
    if maximumOffset - currentOffset <= 10.0 && !collectionViewVM.isLoading {
      onPaginateSwipeUp?()
    }
  }
}
