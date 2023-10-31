//
//  UITableViewExtensions.swift
//  SpotImAdsSample
//
//  Created by Pavlo Yevtukhov on 16.05.2023.
//  Copyright © 2023 Aniview. All rights reserved.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>( _ type: T.Type, reuseIdentifier: String = T.defaultReuseIdentifier) {
        register(T.self, forCellReuseIdentifier: reuseIdentifier)
    }

    func dequeue<T: UITableViewCell>(withIdentifier identifier: String = T.defaultReuseIdentifier) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: identifier) as? T else {
            fatalError("\(identifier) must be registered first")
        }
        return cell
    }
}
