//
//  CarsListViewController.swift
//  View
//
//  Created by Grégoire Lhotellier on 02/09/2018.
//  Copyright © 2018 Grégoire Lhotellier. All rights reserved.
//

import UIKit

public final class CarsListViewController: UIViewController {

    public enum Callback {
        case carSelected(CarList)
        case refresh
    }
    public var callback: ((Callback) -> Void)?

    private let containerViewController: ContainerViewController

    public init() {
        let loadingViewController = LoadingViewController()
        self.containerViewController = ContainerViewController(contentViewController: loadingViewController)
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        add(child: containerViewController)
    }

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

    public func setError(_ errorMessage: String) {
        let errorViewController = ErrorViewController(errorMessage: errorMessage)
        containerViewController.setViewController(errorViewController)
    }

    public func setEmpty(_ emptyMessage: String) {
        let emptyViewController = EmptyViewController(emptyMessage: emptyMessage)
        containerViewController.setViewController(emptyViewController)
    }

}
