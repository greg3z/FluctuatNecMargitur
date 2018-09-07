//
//  ContainerViewController.swift
//  View
//
//  Created by Grégoire Lhotellier on 02/09/2018.
//  Copyright © 2018 Grégoire Lhotellier. All rights reserved.
//

import UIKit

public final class ContainerViewController: UIViewController {

    private var contentViewController: UIViewController

    public init(contentViewController: UIViewController) {
        self.contentViewController = contentViewController
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        displayViewController()
    }

    private func displayViewController() {
        add(child: contentViewController)
    }

    public func setViewController(_ viewController: UIViewController) {
        contentViewController.view.removeFromSuperview()
        contentViewController.removeFromParentViewController()
        contentViewController = viewController
        displayViewController()
    }

}
