//
//  BasicExampleVC.swift
//  SpotImAdsSample
//
//  Created by Pavlo Yevtukhov on 18.10.2023.
//  Copyright © 2023 Aniview. All rights reserved.
//

import SpotImStandaloneAds
import UIKit

final class BasicExampleVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addAdPlacement()
    }

    private func addAdPlacement() {
        let slot = AppConstants.adSlot
        let child = SpotImAds.makePlacement(
            row: slot.row,
            column: slot.column,
            analyticsInfo: .init(url: "landing/BasicExampleVC", postId: "123")
        )
        addChild(child)
        child.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(child.view)
        NSLayoutConstraint.activate([
            child.view.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            child.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            child.view.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -16)
        ])
        child.didMove(toParent: self)
    }
}
