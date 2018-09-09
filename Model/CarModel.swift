//
//  CarModel.swift
//  Model
//
//  Created by Greg Lhotellier on 06/09/2018.
//  Copyright © 2018 Grégoire Lhotellier. All rights reserved.
//

public struct Car {
    
    public let id: Int
    public let brand: String
    public let model: String
    public let power: Int
    
    public init(id: Int, brand: String, model: String, power: Int) {
        self.id = id
        self.brand = brand
        self.model = model
        self.power = power
    }
    
}

public struct CarModel {
    
    public static func getCars(_ callback: @escaping (Result<[Car]>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if arc4random_uniform(10) == 0 {
                callback(.error("Request failed!"))
            } else {
                let car1 = Car(id: 3, brand: "Mercedes", model: "Class E", power: 350)
                let car2 = Car(id: 7, brand: "Porsche", model: "911", power: 450)
                let car3 = Car(id: 9, brand: "BMW", model: "M4", power: 420)
                callback(.success([car1, car2, car3]))
            }
        }
    }
    
    public static func getCar(_ callback: @escaping (Result<Car>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if arc4random_uniform(10) == 0 {
                callback(.error("Request failed!"))
            } else {
                let car = Car(id: 7, brand: "Porsche", model: "911", power: 450)
                callback(.success(car))
            }
        }
    }
    
}

public enum Result<T> {
    case success(T)
    case error(String)
}
