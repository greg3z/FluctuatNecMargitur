//
//  Copyright © 2018 ClassHeroes. All rights reserved.
//

import UIKit

public final class NavigationCoordinator: NSObject, Coordinator {

    public var presentedCoordinator: Coordinator?
    public var viewController: UIViewController {
        return navigationController
    }
    private let navigationController = UINavigationController()
    private var coordinators = [Coordinator]()

    public init(_ coordinator: Coordinator? = nil) {
        super.init()
        navigationController.delegate = self
        if let coordinator = coordinator {
            setRootCoordinator(coordinator)
        }
    }

    public func setRootCoordinator(_ coordinator: Coordinator) {
        coordinators = [coordinator]
        navigationController.viewControllers = [coordinator.viewController]
    }

    public func pop(animated: Bool = true) {
        coordinators.remove(at: coordinators.count - 1)
        navigationController.popViewController(animated: animated)
    }

    public func push(_ coordinator: Coordinator, animated: Bool = true, resetStack: Bool = false) {
        if resetStack {
            coordinators = [coordinator]
            navigationController.setViewControllers([coordinator.viewController], animated: animated)
        } else {
            coordinators.append(coordinator)
            navigationController.pushViewController(coordinator.viewController, animated: animated)
        }
    }

}

extension NavigationCoordinator: UINavigationControllerDelegate {

    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let topViewController = coordinators.last?.viewController else { return }
        if topViewController != viewController {
            _ = coordinators.popLast()
        }
    }

}
