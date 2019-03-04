//
//  BaseTextField.swift
//  List
//
//  Created by Polina Abrosimova on 04/03/2019.
//  Copyright © 2019 Polina Abrosimova. All rights reserved.
//

import UIKit

class BaseTextField: UITextField {
    init() {
        super.init(frame: CGRect.zero)
        
        self.addLine()
    }
    
    func addLine() {
        let bottomLine = SeparatorView()
        
        self.addSubview(bottomLine)
        bottomLine.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.snp.bottom)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
