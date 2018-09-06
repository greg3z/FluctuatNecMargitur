//
//  CarDetails.swift
//  View
//
//  Created by Grégoire Lhotellier on 06/09/2018.
//  Copyright © 2018 Grégoire Lhotellier. All rights reserved.
//

public struct CarDetails {

    public let brand: String
    public let model: String
    public let power: String

    public init(brand: String, model: String, power: String) {
        self.brand = brand
        self.model = model
        self.power = power
    }

}
