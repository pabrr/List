//
//  UITableViewExtension.swift
//  List
//
//  Created by Polina Abrosimova on 26/03/2019.
//  Copyright © 2019 Polina Abrosimova. All rights reserved.
//

import UIKit

extension UITableView {
    convenience init(with: Int) {
        self.init()
        self.tableFooterView = UIView(frame: .zero)
    }
}
