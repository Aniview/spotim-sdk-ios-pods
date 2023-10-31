//
//  TableViewExampleVC.swift
//  SpotImAdsSample
//
//  Created by Pavlo Yevtukhov on 15.05.2023.
//  Copyright © 2023 Aniview. All rights reserved.
//

import UIKit

final class TableViewExampleVC: UIViewController {
    private var dataSource: TableViewDataSource?

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.bindConstraintsToContainerMargines()
        fillDataSource()
    }

    private func fillDataSource() {
        let dataSource = TableViewDataSource(
            parentViewController: self,
            tableView: tableView
        )

        let textRows: [TableRow] = (4...20).map {
            let text = MockText.texts[$0 % MockText.texts.count]
            return .text(text)
        }
        var rows: [TableRow] = [
            .text(MockText.texts[0]),
            .text(MockText.texts[1]),
            .adPlacement(AppConstants.adSlot),
            .text(MockText.texts[2]),
            .text(MockText.texts[3])
        ]
        rows.append(contentsOf: textRows)

        dataSource.setData(rows: rows)
        tableView.dataSource = dataSource
        self.dataSource = dataSource
    }
}
