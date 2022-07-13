//
//  MockUserContactDetailsViewModel.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import Foundation

@testable import AppExercise

class MockUserContactDetailsViewModel: UserContactDetailsViewModelProtocol {
  var imageURL: URL = .dummy
  var nameText: String = ""
  var emailText: String?
  var mobileNumberText: String?
}
