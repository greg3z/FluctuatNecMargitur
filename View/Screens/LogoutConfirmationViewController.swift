//
//  LogoutConfirmationViewController.swift
//  View
//
//  Created by Grégoire Lhotellier on 09/09/2018.
//  Copyright © 2018 Grégoire Lhotellier. All rights reserved.
//

import UIKit

public final class LogoutConfirmationViewController: TextButtonViewController {

    public init() {
        super.init(text: "Are you sure you want to log out?", buttonText: "Yes")
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
