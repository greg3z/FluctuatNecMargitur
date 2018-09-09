//
//  Copyright © 2018 ClassHeroes. All rights reserved.
//

import UIKit

public final class TabBarCoordinator: Coordinator {

    private var coordinators = [Coordinator]()
    public var presentedCoordinator: Coordinator?
    public var rootViewController: UIViewController {
        return tabBarController
    }

    private let tabBarController = UITabBarController()

    public init() {

    }

    public func setCoordinators(_ coordinators: [Coordinator]) {
        self.coordinators = coordinators
        setViewControllers()
    }

    public func replaceCoordinator(at index: Int, by coordinator: Coordinator) {
        coordinators[index] = coordinator
        setViewControllers()
    }

    private func setViewControllers() {
        let viewControllers = coordinators.map { $0.rootViewController }
        tabBarController.setViewControllers(viewControllers, animated: false)
    }

}
