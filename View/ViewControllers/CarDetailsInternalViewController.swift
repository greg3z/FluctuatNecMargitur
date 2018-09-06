//
//  CarDetailsInternalViewController.swift
//  View
//
//  Created by Grégoire Lhotellier on 06/09/2018.
//  Copyright © 2018 Grégoire Lhotellier. All rights reserved.
//

import UIKit

internal final class CarDetailsInternalViewController: UIViewController {

    private let carDetails: CarDetails

    public init(carDetails: CarDetails) {
        self.carDetails = carDetails
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        let label1 = UILabel()
        label1.text = carDetails.brand
        let label2 = UILabel()
        label2.text = carDetails.model
        let label3 = UILabel()
        label3.text = carDetails.power
        let stackView = UIStackView(arrangedSubviews: [label1, label2, label3])
        stackView.axis = .vertical
        view.addCentered(stackView)
    }

}
