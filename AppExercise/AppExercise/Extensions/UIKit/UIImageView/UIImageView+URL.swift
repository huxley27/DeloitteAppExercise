//
//  UIImageView+URL.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2018 Huxley. All rights reserved.
//

import Alamofire
import AlamofireImage

extension UIImageView {
  func setImageWithURL(
    _ url: URL?,
    placeholder: UIImage? = nil,
    onSuccess: @escaping SingleResult<UIImage> = DefaultClosure.singleResult(),
    onError: @escaping ErrorResult = DefaultClosure.singleResult()
  ) {
    guard let url = url else {
      image = nil
      return
    }    
    af_setImage(
      withURL: url,
      placeholderImage: placeholder,
      imageTransition: .crossDissolve(0.3),
      completion: { response in
        if let error = response.result.error {
          debugLog(error.localizedDescription)
          onError(error)
        }
        if let image = response.value {
          onSuccess(image)
        }
      }
    )
  }
}
