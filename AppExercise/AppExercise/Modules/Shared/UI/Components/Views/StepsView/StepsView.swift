//
//  StepsView.swift
//  AppExercise
//
//  Created by HuxleyAlcain ( huxley.alcain@gmail.com )
//  Copyright © 2020 Huxley. All rights reserved.
//

import UIKit

import PureLayout

@IBDesignable
class StepsView: BaseView {
  // Indicates how many step
  @IBInspectable var totalSteps: Int = 4
  
  // Gap in between steps, 0 means no gaps
  @IBInspectable var gapWidth: CGFloat = 3
  
  private var stepper: UIStackView!
  
  // Indicates which step
  private var _onStep = 1
  @IBInspectable var onStep: Int {
    get {
      return _onStep
    }
    set {
      if newValue > totalSteps {
        _onStep = totalSteps
      } else if newValue < 1 {
        _onStep = 1
      } else {
        _onStep = newValue
      }
    }
  }
  
  private var borderWidth: CGFloat = 3
  
  override func prepare() {
    super.prepare()

    // TODO: Review this. This is not the correct color under Master Components, Stylesheet doesn't have an equivalent
    backgroundColor = R.color.greysInactive()!
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    setupIfNeeded()
  }
}

// MARK: - Setup

private extension StepsView {
  func setupIfNeeded() {
    guard stepper == nil else { return }
    
    layer.cornerRadius = cornerRadius
    setupStepper()
    populateStepper()
  }
  
  func setupStepper() {
    let stepper = UIStackView()
    stepper.axis = .horizontal
    stepper.spacing = gapWidth
    stepper.distribution = .fillEqually

    let stepperContainerView = UIView()
    stepperContainerView.backgroundColor = .white
    addSubview(stepperContainerView)
    stepperContainerView.autoSetDimension(.width, toSize: stepperWidth)
    stepperContainerView.autoPinEdge(toSuperviewEdge: .leading)
    stepperContainerView.autoPinEdge(toSuperviewEdge: .top)
    stepperContainerView.autoPinEdge(toSuperviewEdge: .bottom)
    
    stepperContainerView.addSubview(stepper)
    stepper.autoPinEdgesToSuperviewEdges()

    addSubview(stepperContainerView)

    self.stepper = stepper
  }
  
  func populateStepper() {
    (1 ... onStep)
      .map(generatePillView(at:))
      .forEach(stepper.addArrangedSubview)
  }
  
  func generatePillView(at index: Int) -> UIView {
    let pillContainerView = UIView()
    pillContainerView.backgroundColor = .white
    
    let edgeBlockerStackView = UIStackView()
    edgeBlockerStackView.axis = .horizontal
    edgeBlockerStackView.distribution = .fillEqually
    
    let leftView = UIView()
    leftView.backgroundColor = R.color.primaryFull()!
    edgeBlockerStackView.addArrangedSubview(leftView)
    
    let rightView = UIView()
    rightView.backgroundColor = R.color.primaryFull()!
    edgeBlockerStackView.addArrangedSubview(rightView)
    
    pillContainerView.addSubview(edgeBlockerStackView)
    edgeBlockerStackView.autoPinEdgesToSuperviewEdges()
    
    let pill = UIView()
    pill.backgroundColor = R.color.primaryFull()!
    pill.layer.cornerRadius = cornerRadius
    pillContainerView.addSubview(pill)
    pill.autoPinEdgesToSuperviewEdges()
    
    pillContainerView.sendSubviewToBack(edgeBlockerStackView)
    
    if index == 1 {
      leftView.backgroundColor = .white
    }
    
    if index == onStep {
      rightView.backgroundColor = .white
    }
    
    if hasGap {
      leftView.backgroundColor = .white
    }
    
    return pillContainerView
  }
}

// MARK: - Private Getters

private extension StepsView {
  var hasGap: Bool { gapWidth > 0 }
  var cornerRadius: CGFloat { frame.size.height / 2 }
  var progress: CGFloat { CGFloat(onStep) / CGFloat(totalSteps) }
  var stepperWidth: CGFloat { frame.size.width * progress }
}
