//
//  ClosureBarButtonItem.swift
//  Coordinator
//
//  Created by Grégoire Lhotellier on 09/09/2018.
//  Copyright © 2018 Grégoire Lhotellier. All rights reserved.
//

import UIKit

public final class ClosureBarButtonItem: UIBarButtonItem {

    private var callback: (() -> Void)?

    convenience public init(barButtonSystemItem: UIBarButtonSystemItem, callback: (() -> Void)?) {
        self.init(barButtonSystemItem: barButtonSystemItem, target: nil, action: #selector(barButtonItemTapped))
        self.target = self
        self.callback = callback
    }

    @objc func barButtonItemTapped(sender: UIBarButtonItem) {
        callback?()
    }
    
}
