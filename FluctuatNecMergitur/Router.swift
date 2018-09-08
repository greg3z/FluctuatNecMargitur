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
        let tabBarCoordinator = TabBarCoordinator()
        let carsNavigationCoordinator = NavigationCoordinator()
        let carsListCoordinator = createCarsListCoordinator(navigationCoordinator: carsNavigationCoordinator)
        carsNavigationCoordinator.setRootCoordinator(carsListCoordinator)
        let profileCoordinator: Coordinator
        if isLoggedIn() {
            profileCoordinator = createUserCoordinator()
        } else {
            profileCoordinator = createLoginCoordinator()
        }
        tabBarCoordinator.setCoordinators([carsNavigationCoordinator, profileCoordinator])
        windowCoordinator.set(tabBarCoordinator)
    }

    private func isLoggedIn() -> Bool {
        return true
    }

    private func createCarsListCoordinator(navigationCoordinator: NavigationCoordinator) -> CarsListCoordinator {
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

    private func createCarDetailsCoordinator(car: CarList) -> CarDetailsCoordinator {
        let carDetailsCoordinator = CarDetailsCoordinator()
        return carDetailsCoordinator
    }

    private func createLoginCoordinator() -> LoginCoordinator {
        let loginCoordinator = LoginCoordinator()
        loginCoordinator.loginSuccessCallback = {

        }
        return loginCoordinator
    }

    private func createUserCoordinator() -> UserCoordinator {
        let userCoordinator = UserCoordinator()
        return userCoordinator
    }

}
