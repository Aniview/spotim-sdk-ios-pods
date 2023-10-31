//
//  ViewController.swift
//  SpotImStandaloneAds
//
//  Created by Pavlo Yevtukhov on 04/18/2023.
//  Copyright (c) 2023 Pavlo Yevtukhov. All rights reserved.
//

import UIKit

final class LandingViewController: UIViewController {

    private lazy var stackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var basicExampleButton = makeButton(title: "Basic Example")
    private lazy var buttonTableExampleButton = makeButton(title: "Table View")

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(stackView)
        view.backgroundColor = .systemBackground
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor)
        ])

        stackView.addArrangedSubview(basicExampleButton)
        stackView.addArrangedSubview(buttonTableExampleButton)

        basicExampleButton.addTarget(self, action: #selector(onBasicExampleButtonTap), for: .touchUpInside)
        buttonTableExampleButton.addTarget(self, action: #selector(onTableExampleButtonTap), for: .touchUpInside)
    }
}

private extension LandingViewController {
    func makeButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .gray
        button.titleLabel?.font = .systemFont(ofSize: 24)
        button.contentEdgeInsets = .init(top: 10, left: 30, bottom: 10, right: 30)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }

    @objc private func onBasicExampleButtonTap() {
        let viewController = BasicExampleVC()
        navigationController?.pushViewController(viewController, animated: true)
    }

    @objc private func onTableExampleButtonTap() {
        let viewController = TableViewExampleVC()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
