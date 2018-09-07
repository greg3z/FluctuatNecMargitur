//
//  Copyright © 2018 ClassHeroes. All rights reserved.
//

import UIKit

public final class TabBarCoordinator: Coordinator {

    private var coordinators = [Coordinator]()
    public var tabTouched: ((Int, Int) -> Void)?
    public var presentedCoordinator: Coordinator?
    public var rootViewController: UIViewController {
        return tabBarController
    }

    private let tabBarController = UITabBarController()

    public init() {

    }

    public func setCoordinators(_ coordinators: [Coordinator]) {
        self.coordinators = coordinators
        let viewControllers = coordinators.map { $0.rootViewController }
        tabBarController.setViewControllers(viewControllers, animated: false)
    }

}
