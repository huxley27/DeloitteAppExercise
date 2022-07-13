//
//  CollectionSection.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2019 Huxley. All rights reserved.
//

import Foundation

/// This lets you maintain an array of items along with header and footer titles.
public protocol CollectionSection {
  associatedtype ItemType

  var items: [ItemType] { get set }

  var headerTitle: String? { get set }
  var footerTitle: String? { get set }
}

/// A concrete type that conforms to CollectionSection protocol.
///
/// Example usage of this is when you want to maintain groups of data models which will later
/// be displayed on a `UITableView`/`CollectionView` instance. You may want to use this
/// as the Element type of your `ControllerViewModel.sections` Array property.
///
/// We suggest that you specialize this type so you won't have to keep specifying the ItemType. For example:
///
///     class SettingsCollectionSection: GenericCollectionSection<SettingsCellViewModel> {}
///
open class GenericCollectionSection<T>: CollectionSection {
  public typealias ItemType = T
  open var items: [T] = []

  open var headerTitle: String?
  open var footerTitle: String?

  public init() {}
}
