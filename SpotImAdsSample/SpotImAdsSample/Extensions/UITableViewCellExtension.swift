//
//  UITableViewCellExtension.swift
//  SpotImAdsSample
//
//  Created by Pavlo Yevtukhov on 16.05.2023.
//  Copyright © 2023 Aniview. All rights reserved.
//

import UIKit

extension UITableViewCell {
    static var defaultReuseIdentifier: String { .init(describing: Self.self) }
}
