//
//  PageControl.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import PureLayout
import UIKit

@IBDesignable
class PageControl: Control {
  @IBInspectable
  var numberOfPages: Int = 0 {
    didSet {
      updateDisplay()
    }
  }

  var stackView: UIStackView = {
    let view = UIStackView()
    view.alignment = .fill
    view.spacing = 5
    return view
  }()

  var activePageIndicator: UIView = {
    let view = UIView()
    view.autoSetDimensions(to: CGSize(width: 16, height: 8))
    view.layer.cornerRadius = 4
    return view
  }()

  @IBInspectable
  var indicatorTintColor: UIColor = .lightGray {
    didSet {
      stackView.arrangedSubviews.forEach { view in
        guard view != activePageIndicator else { return }
        view.backgroundColor = self.indicatorTintColor
      }
    }
  }

  @IBInspectable
  var activeIndicatorTintColor: UIColor = .black {
    didSet {
      activePageIndicator.backgroundColor = activeIndicatorTintColor
    }
  }

  /// Default is 0. Value pinned to 0..numberOfPages-1.
  private(set) var currentPage: Int = 0

  private var hitArea: CGRect { bounds.insetBy(dx: -16, dy: -16) }

  override func prepare() {
    super.prepare()

    backgroundColor = .clear

    addSubview(stackView)
    stackView.autoPinEdge(toSuperviewEdge: .top)
    stackView.autoPinEdge(toSuperviewEdge: .bottom)
    stackView.autoCenterInSuperview()

    addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selfTapped(_:))))
  }

  func updateDisplay() {
    stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

    guard numberOfPages > 0 else { return }

    stackView.addArrangedSubview(activePageIndicator)

    // Keep this indicator above all the other non-active indicators.
    activePageIndicator.layer.zPosition = 999

    guard numberOfPages > 1 else { return }

    for i in 1 ..< numberOfPages {
      let indicator = UIView()
      indicator.autoSetDimensions(to: CGSize(width: 8, height: 8))
      indicator.backgroundColor = indicatorTintColor
      indicator.layer.cornerRadius = 4
      indicator.layer.zPosition = CGFloat(i)

      stackView.addArrangedSubview(indicator)
    }
  }

  func setCurrentPage(_ page: Int, animated: Bool = false) {
    var page = page
    if page >= numberOfPages {
      page = numberOfPages - 1
    } else if page < 0 {
      page = 0
    }

    let opts: UIView.AnimationOptions = [.beginFromCurrentState]
    UIView.animate(withDuration: animated ? 0.25 : 0, delay: 0, options: opts, animations: {
      self.stackView.insertArrangedSubview(self.activePageIndicator, at: page)
      self.layoutIfNeeded()
    }, completion: nil)

    currentPage = page
  }

  override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
    return hitArea.contains(point)
  }

  // MARK: - Actions

  @IBAction
  func selfTapped(_ sender: AnyObject) {
    guard let tap = sender as? UITapGestureRecognizer else { return }

    let activeDotFrame = activePageIndicator.frame
    let tapX = tap.location(in: self).x - stackView.frame.minX
    if tapX > activeDotFrame.maxX {
      setCurrentPage(currentPage + 1, animated: true)
    } else if tapX < activeDotFrame.minX {
      setCurrentPage(currentPage - 1, animated: true)
    } else {
      return
    }

    sendActions(for: .valueChanged)
  }
}
