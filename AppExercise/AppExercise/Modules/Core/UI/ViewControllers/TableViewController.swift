//
//  TableViewController.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2018 Huxley. All rights reserved.
//

import UIKit

/// A custom TableViewController directly subclassed from ViewController.
///
/// Only use this in cases where you need more freedom to customize your TableViewController.
///
/// **Hierarchy**:
///
///      ↳ UIViewController
///         ↳ ViewController
///            ↳ TableViewController
///
class TableViewController: ViewController, UITableViewDelegate, UITableViewDataSource {
  @IBOutlet var tableView: UITableView!

  /// A Boolean value indicating if the controller clears the selection when the table appears.
  ///
  /// The default value of this property is YES. When YES, the table view controller clears the
  /// table’s current selection when it receives a viewWillAppear: message. Setting this property
  /// to NO preserves the selection.
  var clearsSelectionOnViewWillAppear = true

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    if clearsSelectionOnViewWillAppear {
      if let rows = tableView.indexPathsForSelectedRows {
        rows.forEach { indexPath in
          tableView.deselectRow(at: indexPath, animated: true)
        }
      }
    }
  }

  // MARK: UITableViewDataSource

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    fatalError("tableView(_:numberOfRowsInSection:) is not implemented")
  }

  // -- Row display

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    fatalError("tableView(_:cellForRowAt:) is not implemented")
  }

  /// Defaults to 1
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return nil
  }

  func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
    return nil
  }

  // -- Editing

  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return false
  }

  // -- Moving/reordering

  func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
    return false
  }

  // -- Index

  func sectionIndexTitles(for tableView: UITableView) -> [String]? {
    return nil
  }

  func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
    return NSNotFound
  }

  // -- Data manipulation - insert and delete support

  func tableView(
    _ tableView: UITableView,
    commit editingStyle: UITableViewCell.EditingStyle,
    forRowAt indexPath: IndexPath
  ) {
    //
  }

  // -- Data manipulation - reorder / moving support

  func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    //
  }

  // MARK: UITableViewDataSource
}
