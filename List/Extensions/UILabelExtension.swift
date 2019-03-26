//
//  UILabelExtension.swift
//  List
//
//  Created by Polina Abrosimova on 26/03/2019.
//  Copyright © 2019 Polina Abrosimova. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(withFontSize: CGFloat) {
        self.init()
        self.numberOfLines = 0
        self.font = UIFont.systemFont(ofSize: withFontSize)
    }
}
