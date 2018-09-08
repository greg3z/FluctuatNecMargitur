//
//  TextButtonViewController.swift
//  View
//
//  Created by Grégoire Lhotellier on 08/09/2018.
//  Copyright © 2018 Grégoire Lhotellier. All rights reserved.
//

import UIKit

public final class TextButtonViewController: UIViewController {

    public var buttonTapped: (() -> Void)?

    private let text: String
    private let buttonText: String

    public init(text: String, buttonText: String) {
        self.text = text
        self.buttonText = buttonText
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let label = UILabel()
        label.text = text
        let button = UIButton()
        button.addTarget(self, action: #selector(buttonTappedAction), for: .touchUpInside)
        let stackView = UIStackView(arrangedSubviews: [label, button])
        stackView.axis = .vertical
        view.addCentered(stackView)
    }

    @objc private func buttonTappedAction() {
        buttonTapped?()
    }

}
