//
//  ClosureBarButtonItem.swift
//  Coordinator
//
//  Created by Grégoire Lhotellier on 09/09/2018.
//  Copyright © 2018 Grégoire Lhotellier. All rights reserved.
//

import UIKit

public final class ClosureBarButtonItem: UIBarButtonItem {

    private var actionHandler: (() -> Void)?

    convenience public init(barButtonSystemItem: UIBarButtonSystemItem, actionHandler: (() -> Void)?) {
        self.init(barButtonSystemItem: barButtonSystemItem, target: nil, action: #selector(barButtonItemTapped))
        self.target = self
        self.actionHandler = actionHandler
    }

    @objc func barButtonItemTapped(sender: UIBarButtonItem) {
        actionHandler?()
    }
    
}
