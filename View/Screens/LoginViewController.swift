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
        view.backgroundColor = .white
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.widthAnchor.constraint(equalToConstant: 100).isActive = true
        let stackView = UIStackView(arrangedSubviews: [textField, button])
        stackView.axis = .vertical
        stackView.spacing = 50
        view.addCentered(stackView)
    }

    @objc private func buttonTapped() {
        buttonTappedCallback?(textField.text ?? "")
    }
    
    public func setError(_ error: String) {
        textField.text = error
    }

}
