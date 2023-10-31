//
//  TextInfoCell.swift
//  SpotImAdsSample
//
//  Created by Pavlo Yevtukhov on 16.05.2023.
//  Copyright © 2023 Aniview. All rights reserved.
//

import UIKit

struct ArticleViewModel {
    let title: String
    let text: String
}

final class TextInfoCell: UITableViewCell {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()

    private lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(stackView)
        stackView.bindConstraintsToContainer()

        titleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(contentLabel)
        contentView.backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(_ viewModel: ArticleViewModel) {
        titleLabel.text = viewModel.title
        contentLabel.text = viewModel.text
    }
}
