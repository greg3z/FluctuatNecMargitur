//
//  StartCoordinator.swift
//  Coordinator
//
//  Created by Grégoire Lhotellier on 09/09/2018.
//  Copyright © 2018 Grégoire Lhotellier. All rights reserved.
//

import View

public final class StartCoordinator: Coordinator {

    public var startCallback: (() -> Void)?
    public var viewController: UIViewController {
        return startViewController
    }
    public var presentedCoordinator: Coordinator?
    private let startViewController: StartViewController

    public init() {
        startViewController = StartViewController()
        startViewController.buttonTapped = { [weak self] in
            self?.startCallback?()
        }
    }

}
