//
//  UserViewController.swift
//  View
//
//  Created by Grégoire Lhotellier on 06/09/2018.
//  Copyright © 2018 Grégoire Lhotellier. All rights reserved.
//

import UIKit

public final class UserViewController: LoadingErrorViewController {

    public enum Callback {
        case reload
        case logout
    }
    public var callback: ((Callback) -> Void)?

    public override init() {
        super.init()
        retryButtonTapped = { [weak self] in
            self?.callback?(.reload)
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setUser(_ userName: String) {
        let textButtonViewController = TextButtonViewController(text: userName, buttonText: "Logout")
        textButtonViewController.buttonTapped = { [callback] in
            callback?(.logout)
        }
        containerViewController.setViewController(textButtonViewController)
    }

}
