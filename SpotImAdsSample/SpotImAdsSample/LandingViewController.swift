//
//  ViewController.swift
//  SpotImStandaloneAds
//
//  Created by Pavlo Yevtukhov on 04/18/2023.
//  Copyright (c) 2023 Pavlo Yevtukhov. All rights reserved.
//

import UIKit

import UIKit
import SpotImStandaloneAds

final class LandingViewController: UIViewController {

    private lazy var stackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        let buttonBasicExample = makeButton(title: "Basic", action: #selector(onbasicExampleButtonTap))
        let buttonTableExample = makeButton(title: "Table View", action: #selector(onTableExampleButtonTap))
        let preloadButton = makeButton(title: "Preload", action: #selector(onPreloadButtonTap))

        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor)
        ])

        stackView.addArrangedSubview(buttonBasicExample)
        stackView.addArrangedSubview(buttonTableExample)
        stackView.addArrangedSubview(preloadButton)

        buttonBasicExample.addTarget(self, action: #selector(onbasicExampleButtonTap), for: .touchUpInside)
        buttonTableExample.addTarget(self, action: #selector(onTableExampleButtonTap), for: .touchUpInside)
    }
}

private extension LandingViewController {
    func makeButton(title: String, action: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .gray
        button.titleLabel?.font = .systemFont(ofSize: 24)
        button.contentEdgeInsets = .init(top: 10, left: 30, bottom: 10, right: 30)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }

    @objc func onbasicExampleButtonTap() {
        let viewController = BasicExampleVC()
        navigationController?.pushViewController(viewController, animated: true)
    }

    @objc func onTableExampleButtonTap() {
        let viewController = TableViewExampleVC()
        navigationController?.pushViewController(viewController, animated: true)
    }

    @objc func onPreloadButtonTap() {
        SpotImAds.preload(
            row: AppConstants.adSlot.row,
            column: AppConstants.adSlot.column,
            analyticsInfo: .init(url: "/home", postId: "")
        )
    }
}
