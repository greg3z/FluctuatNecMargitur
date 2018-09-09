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
        case reload
    }
    public var callback: ((Callback) -> Void)?

    public override init() {
        super.init()
        retryButtonTapped = { [weak self] in
            self?.callback?(.reload)
        }
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setCars(_ cars: [CarList]) {
        let carsTableViewController = CarsTableViewController(cars: cars)
        carsTableViewController.callback = { [weak self] in
            switch $0 {
            case .carSelected(let car): self?.callback?(.carSelected(car))
            case .refresh: self?.callback?(.refresh)
            }
        }
        containerViewController.setViewController(carsTableViewController)
    }

}
