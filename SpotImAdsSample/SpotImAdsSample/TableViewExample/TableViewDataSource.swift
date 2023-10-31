//
//  DataSource.swift
//  SpotImAdsSample
//
//  Created by Pavlo Yevtukhov on 26.06.2023.
//  Copyright © 2023 Aniview. All rights reserved.
//

import UIKit

struct AdSlot: Equatable {
    let row: Int
    let column: Int
}

enum TableRow {
    case text(_ text: String)
    case adPlacement(_ slot: AdSlot)
}

final class TableViewDataSource: NSObject {
    weak var parentViewController: UIViewController?

    init(
        parentViewController: UIViewController,
        tableView: UITableView
    ) {
        self.parentViewController = parentViewController
        tableView.register(TextInfoCell.self)
    }

    private var rows: [TableRow] = []

    func setData(rows: [TableRow]) {
        self.rows = rows
    }
}

extension TableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch rows[indexPath.row] {
        case .text(let text):
            let cell: TextInfoCell = tableView.dequeue()
            cell.configure(
                ArticleViewModel(
                    title: "Content row \(indexPath.row)",
                    text: text
                )
            )
            return cell
        case .adPlacement(let slot):
            return makeAdCell(tableView, cellForRowAt: indexPath, slot: slot)
        }
    }

    private func makeAdCell(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath,
        slot: AdSlot
    ) -> UITableViewCell {
        guard let parentViewController = parentViewController else {
            fatalError()
        }

        let reuseIdentifier = AdCell.reuseIdentifier(slot)
        let cell: AdCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? AdCell  else {
                tableView.register(AdCell.self, reuseIdentifier: reuseIdentifier)
                return tableView.dequeue(withIdentifier: reuseIdentifier)
            }
            return cell
        }()

        cell.configure(slot, parentViewController: parentViewController, tableView: tableView)
        cell.separatorInset = .init(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude) // hide separator
        cell.selectionStyle = .none
        return cell
    }
}
