//
//  LoadingErrorViewController.swift
//  View
//
//  Created by Grégoire Lhotellier on 08/09/2018.
//  Copyright © 2018 Grégoire Lhotellier. All rights reserved.
//

import UIKit

public class LoadingErrorViewController: UIViewController {

    internal let containerViewController: ContainerViewController
    internal var retryButtonTapped: (() -> Void)?

    public init() {
        self.containerViewController = ContainerViewController(contentViewController: LoadingViewController())
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        add(child: containerViewController)
    }

    public func setError(_ errorMessage: String) {
        let textButtonViewController = TextButtonViewController(text: errorMessage, textColor: .red, buttonText: "Retry")
        textButtonViewController.buttonTapped = { [retryButtonTapped] in
            retryButtonTapped?()
        }
        containerViewController.setViewController(textButtonViewController)
    }

    public func setLoading() {
        let loadingViewController = LoadingViewController()
        containerViewController.setViewController(loadingViewController)
    }

}
