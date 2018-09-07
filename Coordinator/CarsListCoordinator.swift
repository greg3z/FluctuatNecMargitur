//
//  CarsListCoordinator.swift
//  Coordinator
//
//  Created by Greg Lhotellier on 06/09/2018.
//  Copyright © 2018 Grégoire Lhotellier. All rights reserved.
//

import View

public final class CarsListCoordinator {
    
    public enum Callback {
        case carSelected(CarList)
    }
    public var callback: ((Callback) -> Void)?
    
    private func createCarsListViewController() -> UIViewController {
        let carsListViewController = CarsListViewController()
        carsListViewController.callback = { [callback] in
            switch $0 {
            case .carSelected(let car):
                callback?(.carSelected(car))
            case .refresh:
                break
            }
        }
        return carsListViewController
    }
    
}
