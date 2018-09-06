//
//  CarDetailsViewController.swift
//  View
//
//  Created by Grégoire Lhotellier on 06/09/2018.
//  Copyright © 2018 Grégoire Lhotellier. All rights reserved.
//

import UIKit

public final class CarDetailsViewController: UIViewController {

    private let containerViewController: ContainerViewController

    public init() {
        self.containerViewController = ContainerViewController(contentViewController: LoadingViewController())
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        add(child: containerViewController)
    }

    public func setCar(_ carDetails: CarDetails) {
        let carDetailsInternalViewController = CarDetailsInternalViewController(carDetails: carDetails)
        containerViewController.setViewController(carDetailsInternalViewController)
    }

    public func setError(_ errorMessage: String) {
        let errorViewController = ErrorViewController(errorMessage: errorMessage)
        containerViewController.setViewController(errorViewController)
    }

}
