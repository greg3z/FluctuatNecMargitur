//
//  LoginCoordinator.swift
//  Coordinator
//
//  Created by Greg Lhotellier on 06/09/2018.
//  Copyright © 2018 Grégoire Lhotellier. All rights reserved.
//

import Model
import View

public final class LoginCoordinator {
    
    private lazy var loginViewController = self.createLoginViewController()
    
    public init() {
        
    }
    
    private func createLoginViewController() -> LoginViewController {
        let loginViewController = LoginViewController()
        loginViewController.buttonTappedCallback = { _ in
            
        }
        return loginViewController
    }
    
}
