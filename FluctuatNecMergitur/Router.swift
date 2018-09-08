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

    public init(windowCoordinator: WindowCoordinator) {
        self.windowCoordinator = windowCoordinator
        start()
    }

    public func start() {
        let tabBarCoordinator = createTabBarCoordinator()
        windowCoordinator.set(tabBarCoordinator)
    }

    private func isLoggedIn() -> Bool {
        return true
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
        return tabBarCoordinator
    }

    private func createCarsListCoordinator(navigationCoordinator: NavigationCoordinator) -> Coordinator {
        let carsListCoordinator = CarsListCoordinator()
        carsListCoordinator.callback = { [createCarDetailsCoordinator] in
            switch $0 {
            case .carSelected(let car):
                let carDetailsCoordinator = createCarDetailsCoordinator(car)
                navigationCoordinator.push(carDetailsCoordinator)
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
        loginCoordinator.loginSuccessCallback = {

        }
        return loginCoordinator
    }

    private func createUserCoordinator() -> Coordinator {
        let userCoordinator = UserCoordinator()
        return userCoordinator
    }

}
