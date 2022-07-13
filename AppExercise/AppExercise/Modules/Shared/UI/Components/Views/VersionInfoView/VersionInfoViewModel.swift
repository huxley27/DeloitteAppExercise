//
//  VersionInfoViewModel.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2021 Huxley. All rights reserved.
//

import Foundation

class VersionInfoViewModel: VersionInfoViewModelProtocol {
}

// MARK: - Getters

extension VersionInfoViewModel {
  var versionText: String {
    S.versionInfo(
      App.releaseVersion,
      App.buildNumber
    )
  }
}
