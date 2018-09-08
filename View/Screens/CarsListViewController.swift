//
//  CarsListViewController.swift
//  View
//
//  Created by Grégoire Lhotellier on 02/09/2018.
//  Copyright © 2018 Grégoire Lhotellier. All rights reserved.
//

import UIKit

public final class CarsListViewController: LoadingErrorEmptyViewController {

    public enum Callback {
        case carSelected(CarList)
        case refresh
    }
    public var callback: ((Callback) -> Void)?

    public func setCars(_ cars: [CarList]) {
        let carsTableViewController = CarsTableViewController(cars: cars)
        carsTableViewController.callback = { [callback] in
            switch $0 {
            case .carSelected(let car): callback?(.carSelected(car))
            case .refresh: callback?(.refresh)
            }
        }
        containerViewController.setViewController(carsTableViewController)
    }

}
