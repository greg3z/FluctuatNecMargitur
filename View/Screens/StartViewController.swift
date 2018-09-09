//
//  StartViewController.swift
//  View
//
//  Created by Grégoire Lhotellier on 09/09/2018.
//  Copyright © 2018 Grégoire Lhotellier. All rights reserved.
//

import UIKit

public final class StartViewController: TextButtonViewController {

    public init() {
        super.init(text: "Welcome to the Cars app!", buttonText: "Start")
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
