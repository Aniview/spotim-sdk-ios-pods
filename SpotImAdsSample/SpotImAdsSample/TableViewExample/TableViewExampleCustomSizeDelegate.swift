//
//  TableViewExampleCustomSizeDelegate.swift
//  SpotImAdsSample
//
//  Created by Pavlo Yevtukhov on 25.08.2023.
//  Copyright © 2023 Aniview. All rights reserved.
//

import UIKit
import SpotImStandaloneAds

final class TableViewExampleCustomSizeDelegate {
    private let isAnimated = true

    private let tableView: UITableView
    private let heightConstr: NSLayoutConstraint

    init(content: UIView, tableView: UITableView) {
        self.tableView = tableView
        heightConstr = content.heightAnchor.constraint(equalToConstant: 0)
        heightConstr.priority = .init(500) // avoid layout conflict in UITableView
        heightConstr.isActive = true
    }
}

extension TableViewExampleCustomSizeDelegate: SizeDelegate {
    func adPlacementHeightWillChange(to newValue: CGFloat) {
        guard newValue != heightConstr.constant else { return }

        heightConstr.constant = newValue

        if isAnimated {
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
        } else {
            tableView.reloadData()
        }
    }
}
