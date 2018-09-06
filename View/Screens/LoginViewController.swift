//
//  LoginViewController.swift
//  View
//
//  Created by Grégoire Lhotellier on 06/09/2018.
//  Copyright © 2018 Grégoire Lhotellier. All rights reserved.
//

import UIKit

public final class LoginViewController: UIViewController {

    public var buttonTappedCallback: ((String) -> Void)?

    private lazy var textField = UITextField()

    public init() {
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton()
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        let stackView = UIStackView(arrangedSubviews: [textField, button])
        stackView.axis = .vertical
        view.addCentered(stackView)
    }

    @objc private func buttonTapped() {
        buttonTappedCallback?(textField.text ?? "")
    }

}
