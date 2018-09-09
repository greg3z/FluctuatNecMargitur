//
//  Coordinator.swift
//  Coordinator
//
//  Copyright © 2017 Liquidsoul. All rights reserved.
//

import View

public protocol Coordinator: class {
    var rootViewController: UIViewController { get }
    var presentedCoordinator: Coordinator? { get set }
}

extension Coordinator {

    public func present(_ coordinator: Coordinator, animated: Bool = true, completion: (() -> Void)? = nil) {
        presentedCoordinator = coordinator
        rootViewController.present(coordinator.rootViewController, animated: animated, completion: completion)
    }

    public func dismissPresentedCoordinator(animated: Bool = true, completion: (() -> Void)? = nil) {
        presentedCoordinator?.rootViewController.dismiss(animated: animated) { [weak self] in
            self?.presentedCoordinator = nil
            completion?()
        }
    }

    public func setNavBarTitle(_ title: String) {
        rootViewController.title = title
    }

    public func setTabBarTitle(_ title: String) {
        rootViewController.tabBarItem.title = title
    }

    public func setDismissButton() {
        rootViewController.navigationItem.leftBarButtonItem = ClosureBarButtonItem(barButtonSystemItem: .cancel) { [weak rootViewController] in
            rootViewController?.dismiss(animated: true)
        }
    }

}
