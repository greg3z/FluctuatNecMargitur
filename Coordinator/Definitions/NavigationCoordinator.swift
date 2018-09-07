//
//  Copyright © 2018 ClassHeroes. All rights reserved.
//

import UIKit

public final class NavigationCoordinator: Coordinator {

    public var presentedCoordinator: Coordinator?
    public var rootViewController: UIViewController {
        return navigationController
    }
    private let navigationController = UINavigationController()
    private var coordinators = [Coordinator]()

    public init(_ coordinator: Coordinator? = nil) {
        if let coordinator = coordinator {
            setRootCoordinator(coordinator)
        }
    }

    public func setRootCoordinator(_ coordinator: Coordinator) {
        coordinators = [coordinator]
        navigationController.viewControllers = [coordinator.rootViewController]
    }

    public func pop(animated: Bool = true) {
        coordinators.remove(at: coordinators.count - 1)
        navigationController.popViewController(animated: animated)
    }

    public func push(_ coordinator: Coordinator, animated: Bool = true, resetStack: Bool = false) {
        if resetStack {
            coordinators = [coordinator]
            navigationController.setViewControllers([coordinator.rootViewController], animated: animated)
        } else {
            coordinators.append(coordinator)
            navigationController.pushViewController(coordinator.rootViewController, animated: animated)
        }
    }

}
