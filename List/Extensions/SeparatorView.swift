//
//  SeparatorView.swift
//  List
//
//  Created by Polina Abrosimova on 04/03/2019.
//  Copyright © 2019 Polina Abrosimova. All rights reserved.
//

import UIKit

class SeparatorView: UIView {
    
    init() {
        super.init(frame: CGRect.zero)
        
        self.backgroundColor = .blue
        self.layer.cornerRadius = 1
        
        self.snp.makeConstraints { (make) in
            make.height.equalTo(1.5)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
