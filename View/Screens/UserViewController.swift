//
//  UserViewController.swift
//  View
//
//  Created by Grégoire Lhotellier on 06/09/2018.
//  Copyright © 2018 Grégoire Lhotellier. All rights reserved.
//

import UIKit

public final class UserViewController: UIViewController {

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

    public func setUser(_ userName: String) {
        let userInternalViewController = UserInternalViewController(name: userName)
        containerViewController.setViewController(userInternalViewController)
    }

    public func setError(_ errorMessage: String) {
        let errorViewController = ErrorViewController(errorMessage: errorMessage)
        containerViewController.setViewController(errorViewController)
    }

}
