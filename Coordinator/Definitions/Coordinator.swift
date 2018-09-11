//
//  Coordinator.swift
//  Coordinator
//
//  Copyright © 2017 Liquidsoul. All rights reserved.
//

import View

public protocol Coordinator: class {
    var viewController: UIViewController { get }
    var presentedCoordinator: Coordinator? { get set }
}

extension Coordinator {

    public func present(_ coordinator: Coordinator, animated: Bool = true, completion: (() -> Void)? = nil) {
        presentedCoordinator = coordinator
        viewController.present(coordinator.viewController, animated: animated, completion: completion)
    }

    public func dismissPresentedCoordinator(animated: Bool = true, completion: (() -> Void)? = nil) {
        presentedCoordinator?.viewController.dismiss(animated: animated) { [weak self] in
            self?.presentedCoordinator = nil
            completion?()
        }
    }

    public func setNavBarTitle(_ title: String) {
        viewController.title = title
    }

    public func setTabBarTitle(_ title: String) {
        viewController.tabBarItem.title = title
    }

    public func setDismissButton(_ callback: @escaping () -> Void) {
        viewController.navigationItem.leftBarButtonItem = ClosureBarButtonItem(barButtonSystemItem: .cancel, callback: callback)
    }

}
