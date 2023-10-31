//
//  TextViewController.swift
//  SpotImAdsSample
//
//  Created by Pavlo Yevtukhov on 27.07.2023.
//  Copyright © 2023 Aniview. All rights reserved.
//

import UIKit

final class TextViewController: UIViewController {
    private let text: String

    init(text: String) {
        self.text = text
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("unavailable")
    }

    private weak var closeButton: UIView?

    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.font = .systemFont(ofSize: 18)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = .label
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        view.addSubview(textView)

        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        addCopyButton()

        textView.text =  text
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        addCloseButtonIfNeeded()
    }

    private func addCopyButton() {
        let copyButton = UIButton()
        copyButton.setTitle("Copy", for: .normal)
        copyButton.setTitleColor(.black, for: .normal)
        copyButton.setTitleColor(.blue, for: .highlighted)
        copyButton.titleLabel?.font = .systemFont(ofSize: 20)
        copyButton.addTarget(self, action: #selector(onCopyButttonClick), for: .touchUpInside)
        copyButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(copyButton)
        NSLayoutConstraint.activate([
            copyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            copyButton.topAnchor.constraint(equalTo: view.topAnchor),
            copyButton.widthAnchor.constraint(equalToConstant: 100),
            copyButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    private func addCloseButtonIfNeeded() {
        closeButton?.removeFromSuperview()
        guard presentingViewController != nil else { return }

        let button = UIButton()
        self.closeButton = button
        button.setTitle("X", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.addTarget(self, action: #selector(onCloseButttonClick), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)

        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button.topAnchor.constraint(equalTo: view.topAnchor),
            button.widthAnchor.constraint(equalToConstant: 44),
            button.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    @objc
    private func onCopyButttonClick() {
        UIPasteboard.general.string = textView.text
    }

    @objc
    private func onCloseButttonClick() {
        dismiss(animated: true)
    }
}
