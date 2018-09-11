//
//  LogoutConfirmationCoordinator.swift
//  Coordinator
//
//  Created by Grégoire Lhotellier on 09/09/2018.
//  Copyright © 2018 Grégoire Lhotellier. All rights reserved.
//

import View

public final class LogoutConfirmationCoordinator: Coordinator {

    public var logoutCallback: (() -> Void)?
    public var viewController: UIViewController {
        return logoutConfirmationViewController
    }
    public var presentedCoordinator: Coordinator?
    private let logoutConfirmationViewController: LogoutConfirmationViewController

    public init() {
        logoutConfirmationViewController = LogoutConfirmationViewController()
        logoutConfirmationViewController.buttonTapped = { [weak self] in
            self?.logoutCallback?()
        }
    }

}
