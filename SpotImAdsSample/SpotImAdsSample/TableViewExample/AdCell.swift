//
//  AdsCell.swift
//  SpotImAdsSample
//
//  Created by Pavlo Yevtukhov on 15.05.2023.
//  Copyright © 2023 Aniview. All rights reserved.
//

import UIKit
import SpotImStandaloneAds

final class AdCell: UITableViewCell {
    private weak var adContent: UIViewController?
    private var sizeDelegateRetainRef: TableViewExampleCustomSizeDelegate?

    private var isConfigured: Bool = false

    func configure(
        _ slot: AdSlot,
        parentViewController: UIViewController,
        tableView: UITableView
    ) {
        guard !isConfigured else {
            return
        }
        isConfigured = true
        let placementVC = SpotImAds.makePlacement(row: slot.row, column: slot.column)
        parentViewController.addChild(placementVC)
        contentView.addSubview(placementVC.view)
        placementVC.view.bindConstraintsToContainer()
        placementVC.didMove(toParent: parentViewController)

        // OPTIONAL: override default sizing
        sizeDelegateRetainRef = TableViewExampleCustomSizeDelegate(content: placementVC.view, tableView: tableView)
        placementVC.sizeDelegate = sizeDelegateRetainRef
    }
}

extension AdCell {
    // reuse only when the same slot
    static func reuseIdentifier(_ slot: AdSlot) -> String {
        "AdCell_\(slot.row)_\(slot.column)"
    }
}
