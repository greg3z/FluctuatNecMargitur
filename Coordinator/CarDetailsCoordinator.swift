//
//  CarDetailsCoordinator.swift
//  Coordinator
//
//  Created by Greg Lhotellier on 06/09/2018.
//  Copyright © 2018 Grégoire Lhotellier. All rights reserved.
//

import Model
import View

public final class CarDetailsCoordinator {
    
    private lazy var carDetailsViewController = self.createCarDetailsViewController()
    
    public init() {
        CarModel.getCar { [carDetailsViewController] in
            switch $0 {
            case .success(let car):
                let carDetails = car.toCarDetails
                carDetailsViewController.setCar(carDetails)
            case .error(let error):
                carDetailsViewController.setError(error)
            }
        }
    }
    
    private func createCarDetailsViewController() -> CarDetailsViewController {
        let carDetailsViewController = CarDetailsViewController()
        return carDetailsViewController
    }
    
}
