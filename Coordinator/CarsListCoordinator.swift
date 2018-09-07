//
//  CarsListCoordinator.swift
//  Coordinator
//
//  Created by Greg Lhotellier on 06/09/2018.
//  Copyright © 2018 Grégoire Lhotellier. All rights reserved.
//

import Model
import View

public final class CarsListCoordinator {
    
    public enum Callback {
        case carSelected(CarList)
    }
    public var callback: ((Callback) -> Void)?
    
    private lazy var carsListViewController = self.createCarsListViewController()
    
    public init() {
        CarModel.getCars { [carsListViewController] in
            switch $0 {
            case .success(let cars):
                if cars.isEmpty {
                    carsListViewController.setEmpty("No cars")
                } else {
                    let carsList = cars.map { $0.toCarList }
                    carsListViewController.setCars(carsList)
                }
            case .error(let error):
                carsListViewController.setError(error)
            }
        }
    }
    
    private func createCarsListViewController() -> CarsListViewController {
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

extension Car {
    
    var toCarList: CarList {
        return CarList(brand: brand, model: model)
    }
    
    var toCarDetails: CarDetails {
        return CarDetails(brand: brand, model: model, power: "\(power)ch")
    }
    
}