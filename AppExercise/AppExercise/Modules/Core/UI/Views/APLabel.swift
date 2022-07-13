//
//  APLabel.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2021 Huxley. All rights reserved.
//  

import Foundation
import UIKit

@IBDesignable
class APLabelBase: UILabel {
  var fontStyle: UIFont { T.textStyle.body }

  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }

  override func prepareForInterfaceBuilder() {
    setup()
  }

  private func setup() {
    font = fontStyle
  }
}

class APLabelLargeTitle: APLabelBase {
  override var fontStyle: UIFont { T.textStyle.largeTitle }
}

class APLabelTitle1: APLabelBase {
  override var fontStyle: UIFont { T.textStyle.title1 }
}

class APLabelTitle2: APLabelBase {
  override var fontStyle: UIFont { T.textStyle.title2 }
}

class APLabelTitle3: APLabelBase {
  override var fontStyle: UIFont { T.textStyle.title3 }
}

class APLabelHeadline: APLabelBase {
  override var fontStyle: UIFont { T.textStyle.headline }
}

class APLabelBody: APLabelBase {}

class APLabelBodyMedium: APLabelBase {
  override var fontStyle: UIFont { T.textStyle.bodyMedium }
}

class APLabelCallout: APLabelBase {
  override var fontStyle: UIFont { T.textStyle.callout }
}

class APLabelSubHeadline: APLabelBase {
  override var fontStyle: UIFont { T.textStyle.subHeadline }
}

class APLabelSubHeadlineMedium: APLabelBase {
  override var fontStyle: UIFont { T.textStyle.subHeadlineMedium }
}

class APLabelFootnote: APLabelBase {
  override var fontStyle: UIFont { T.textStyle.footnote }
}

class APLabelCaption: APLabelBase {
  override var fontStyle: UIFont { T.textStyle.caption }
}

class APLabelCaptionSemibold: APLabelBase {
  override var fontStyle: UIFont { T.textStyle.captionSemibold }
}
