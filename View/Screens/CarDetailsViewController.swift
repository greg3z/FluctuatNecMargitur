//
//  CarDetailsViewController.swift
//  View
//
//  Created by Grégoire Lhotellier on 06/09/2018.
//  Copyright © 2018 Grégoire Lhotellier. All rights reserved.
//

import UIKit

public final class CarDetailsViewController: LoadingErrorViewController {

    public var reloadCallback: (() -> Void)?

    public override init() {
        super.init()
        retryButtonTapped = { [weak self] in
            self?.reloadCallback?()
        }
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setCar(_ carDetails: CarDetails) {
        let carDetailsInternalViewController = CarDetailsInternalViewController(carDetails: carDetails)
        containerViewController.setViewController(carDetailsInternalViewController)
    }

}
