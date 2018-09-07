//
//  UserInternalViewController.swift
//  View
//
//  Created by Grégoire Lhotellier on 07/09/2018.
//  Copyright © 2018 Grégoire Lhotellier. All rights reserved.
//

import UIKit

public final class UserInternalViewController: UIViewController {

    private let name: String

    public init(name: String) {
        self.name = name
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel()
        label.text = name
        view.addCentered(label)
    }

}
