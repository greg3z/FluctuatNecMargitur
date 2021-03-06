//
//  Copyright © 2018 ClassHeroes. All rights reserved.
//

import UIKit
import View

public final class WindowCoordinator: Coordinator {

    public var presentedCoordinator: Coordinator?
    public var viewController: UIViewController {
        return containerViewController
    }

    private let window: UIWindow
    private let containerViewController: ContainerViewController
    private var coordinator: Coordinator?

    public init(window: UIWindow) {
        self.window = window
        self.containerViewController = ContainerViewController(contentViewController: UIViewController())
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }

    public func set(_ coordinator: Coordinator, animated: Bool = true) {
        containerViewController.setViewController(coordinator.viewController)
        self.coordinator = coordinator
    }

}
