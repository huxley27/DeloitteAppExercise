import UIKit

extension UIView {
  /// Configure the shadow properties of this view.
  ///
  /// We use UIBezierPath for our shadow to help account for this view's corner radius, if there's any.
  ///
  /// **Caveats**
  ///
  /// Because its path is drawn once and only during the call to this method, succeeding changes
  /// in the size of this view could drastically affect the shadow's perspective. To keep the two
  /// in-sync all the time, you need to make sure you're calling this method inside `layoutSubviews`
  /// of `UIView` or in `viewDidLayoutSubviews` of `UIViewController`.
  ///
  func applyShadow(
    color: UIColor,
    opacity: Float = 0.5,
    offSet: CGSize = CGSize(width: -1, height: 1),
    radius: CGFloat = 1
  ) {
    layer.masksToBounds = false
    layer.shadowColor = color.cgColor
    layer.shadowOpacity = opacity
    layer.shadowOffset = offSet
    layer.shadowRadius = radius
    layer.shouldRasterize = true
    layer.rasterizationScale = UIScreen.main.scale

    var _frame = frame
    _frame.origin = .zero

    layer.shadowPath = UIBezierPath(roundedRect: _frame, cornerRadius: layer.cornerRadius).cgPath
  }
}
