//
//  Router.swift
//  FluctuatNecMergitur
//
//  Created by Grégoire Lhotellier on 07/09/2018.
//  Copyright © 2018 Grégoire Lhotellier. All rights reserved.
//

import Coordinator
import View

public final class Router {

    private let windowCoordinator: WindowCoordinator
    private var tabBarCoordinator: TabBarCoordinator?

    public init(windowCoordinator: WindowCoordinator) {
        self.windowCoordinator = windowCoordinator
        start()
    }

    public func start() {
        if isLoggedIn() {
            let tabBarCoordinator = createTabBarCoordinator()
            windowCoordinator.set(tabBarCoordinator)
        } else {
            let startCoordinator = createStartCoordinator()
            windowCoordinator.set(startCoordinator)
        }
    }

    private func isLoggedIn() -> Bool {
        return false
    }

}

private extension Router {

    private func createCarsNavigationCoordinator() -> Coordinator {
        let carsNavigationCoordinator = NavigationCoordinator()
        let carsListCoordinator = createCarsListCoordinator(navigationCoordinator: carsNavigationCoordinator)
        carsListCoordinator.setNavBarTitle("Cars")
        carsNavigationCoordinator.setRootCoordinator(carsListCoordinator)
        return carsNavigationCoordinator
    }

    private func createProfileCoordinator() -> Coordinator {
        let profileCoordinator: Coordinator
        if isLoggedIn() {
            profileCoordinator = createUserCoordinator()
        } else {
            profileCoordinator = createLoginCoordinator()
        }
        return profileCoordinator
    }

    private func createTabBarCoordinator() -> Coordinator {
        let tabBarCoordinator = TabBarCoordinator()
        let carsNavigationCoordinator = createCarsNavigationCoordinator()
        carsNavigationCoordinator.setTabBarTitle("Cars")
        let profileCoordinator = createProfileCoordinator()
        profileCoordinator.setTabBarTitle("Profile")
        tabBarCoordinator.setCoordinators([carsNavigationCoordinator, profileCoordinator])
        self.tabBarCoordinator = tabBarCoordinator
        return tabBarCoordinator
    }

    private func createCarsListCoordinator(navigationCoordinator: NavigationCoordinator) -> Coordinator {
        let carsListCoordinator = CarsListCoordinator()
        carsListCoordinator.callback = { [createCarDetailsCoordinator, weak navigationCoordinator] in
            switch $0 {
            case .carSelected(let car):
                let carDetailsCoordinator = createCarDetailsCoordinator(car)
                navigationCoordinator?.push(carDetailsCoordinator)
            }
        }
        return carsListCoordinator
    }

    private func createCarDetailsCoordinator(car: CarList) -> Coordinator {
        let carDetailsCoordinator = CarDetailsCoordinator()
        return carDetailsCoordinator
    }

    private func createLoginCoordinator() -> Coordinator {
        let loginCoordinator = LoginCoordinator()
        loginCoordinator.loginSuccessCallback = { [createUserCoordinator, weak self] in
            let userCoordinator = createUserCoordinator()
            userCoordinator.setTabBarTitle("Profile")
            self?.tabBarCoordinator?.replaceCoordinator(at: 1, by: userCoordinator)
        }
        return loginCoordinator
    }

    private func createUserCoordinator() -> Coordinator {
        let userCoordinator = UserCoordinator()
        userCoordinator.logoutCallback = { [createStartCoordinator, windowCoordinator, weak self] in
            let startCoordinator = createStartCoordinator()
            windowCoordinator.set(startCoordinator)
            self?.tabBarCoordinator = nil
        }
        return userCoordinator
    }

    private func createStartCoordinator() -> Coordinator {
        let startCoordinator = StartCoordinator()
        startCoordinator.startCallback = { [createTabBarCoordinator, windowCoordinator] in
            let tabBarCoordinator = createTabBarCoordinator()
            windowCoordinator.set(tabBarCoordinator)
        }
        return startCoordinator
    }

}
