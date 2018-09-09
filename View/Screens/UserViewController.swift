//
//  UserViewController.swift
//  View
//
//  Created by Grégoire Lhotellier on 06/09/2018.
//  Copyright © 2018 Grégoire Lhotellier. All rights reserved.
//

import UIKit

public final class UserViewController: LoadingErrorViewController {

    public var reloadCallback: (() -> Void)?

    public override init() {
        super.init()
        retryButtonTapped = { [weak self] in
            self?.reloadCallback?()
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setUser(_ userName: String) {
        let textButtonViewController = TextButtonViewController(text: userName, buttonText: "Logout")
        containerViewController.setViewController(textButtonViewController)
    }

}
