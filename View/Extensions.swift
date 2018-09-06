//
//  Extensions.swift
//  View
//
//  Created by Grégoire Lhotellier on 02/09/2018.
//  Copyright © 2018 Grégoire Lhotellier. All rights reserved.
//

import UIKit

internal extension UIView {

    internal func addCentered(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = true
        addSubview(view)
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: centerXAnchor),
            view.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
    }

}

internal extension UIViewController {

    internal func add(child viewController: UIViewController) {
        view.addSubview(viewController.view)
        viewController.view.frame = view.bounds
        addChildViewController(viewController)
        viewController.didMove(toParentViewController: self)
    }

}
