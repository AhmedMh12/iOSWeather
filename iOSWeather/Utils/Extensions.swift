//
//  Extensions.swift
//  iOSWeather
//
//  Created by Ahmed Mahouchi on 18/7/2022.
//

import Foundation
import UIKit

// MARK: - UIButton
extension UIButton {
    
    /// Bind a UIButton in order to enable/disable it automatically
    ///
    /// Example:
    /// ```
    /// btnSearch.bindTo(viewModel.isButtonEnabled)
    /// ```
    /// - Parameter bindable: the bounded property
    func bindTo(_ bindable: Binder<Bool>) {
        bindable.bind { [weak self] isEnabled in
            self?.isEnabled = true
        }
    }
}

// MARK: - UITableView
extension UITableView {
    
    /// Bind a UITableView in order to reload it automatically once the datasource array mutates
    ///
    /// Example:
    /// ```
    /// tableView.bindTo(viewModel.results)
    /// ```
    /// - Parameter bindable: the bounded property
    func bindTo<T>(_ bindable: Binder<T>) {
        bindable.bind { [weak self] _ in
            self?.reloadData()
        }
    }
}

// MARK: - UISwitch
extension UISwitch {
    
    /// Bind a UISwitch in order to enable/disable it automatically
    ///
    /// Example:
    /// ```
    /// swtMain.bindTo(viewModel.isSwitchEnabled)
    /// ```
    /// - Parameter bindable: the bounded property
    func bindTo(_ bindable: Binder<Bool>) {
        bindable.bind { [weak self] isOn in
            self?.setOn(isOn, animated: true)
        }
    }
}

// MARK: - UIActivityIndicatorView
extension UIActivityIndicatorView {
    
    /// Bind a UIActivityIndicatorView in order to enable/disable  and animate it automatically
    ///
    /// Example:
    /// ```
    /// activityIndicator.bindTo(viewModel.isLoadingEnabled)
    /// ```
    /// - Parameter bindable: the bounded property
    func bindTo(_ bindable: Binder<Bool>) {
        bindable.bind { [weak self] isEnabled in
            if isEnabled {
                self?.isHidden = false
                self?.startAnimating()
            } else {
                self?.isHidden = true
                self?.stopAnimating()
            }
        }
    }
}
extension UINavigationController {
  func popToViewController(ofClass: AnyClass, animated: Bool = true) {
    if let vc = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
      popToViewController(vc, animated: animated)
    }
  }
}
