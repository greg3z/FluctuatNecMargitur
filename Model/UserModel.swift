//
//  UserModel.swift
//  Model
//
//  Created by Greg Lhotellier on 06/09/2018.
//  Copyright © 2018 Grégoire Lhotellier. All rights reserved.
//

public struct User {
    
    public let name: String
    
    public init(name: String) {
        self.name = name
    }
    
}

public struct UserModel {
    
    public static func login(_ user: String, callback: @escaping (Result<User>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if arc4random_uniform(2) == 0 {
                callback(.error("Login failed!"))
            } else {
                let user = User(name: "Greg")
                callback(.success(user))
            }
        }
    }
    
    public static func getUser(_ callback: @escaping (Result<User>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if arc4random_uniform(2) == 0 {
                callback(.error("Request failed!"))
            } else {
                let user = User(name: "Greg")
                callback(.success(user))
            }
        }
    }
    
}
