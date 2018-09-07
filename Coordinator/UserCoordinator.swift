//
//  UserCoordinator.swift
//  Coordinator
//
//  Created by Grégoire Lhotellier on 07/09/2018.
//  Copyright © 2018 Grégoire Lhotellier. All rights reserved.
//

import Model
import View

public final class UserCoordinator: Coordinator {

    public var rootViewController: UIViewController {
        return userViewController
    }
    public var presentedCoordinator: Coordinator?

    private lazy var userViewController = self.createUserViewController()

    public init() {
        UserModel.getUser { [userViewController] in
            switch $0 {
            case .success(let user):
                userViewController.setUser(user.name)
            case .error(let error):
                userViewController.setError(error)
            }
        }
    }

    private func createUserViewController() -> UserViewController {
        let userViewController = UserViewController()
        return userViewController
    }

}
