//
//  ListTableViewCell.swift
//  List
//
//  Created by Polina Abrosimova on 28/02/2019.
//  Copyright © 2019 Polina Abrosimova. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell, BaseTableViewCellProtocol {
    static var cellID: String = "ListTableViewCellID"
    
    var titleLabel = UILabel(withFontSize: 16)
    var messageLabel = UILabel(withFontSize: 14)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView() {
        self.separatorInset = .zero
        
        self.contentView.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(8)
            make.left.equalTo(16)
            make.right.equalTo(-8)
        }
        
        self.contentView.addSubview(self.messageLabel)
        self.messageLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleLabel.snp.bottom).inset(-4)
            make.left.equalTo(self.titleLabel.snp.left)
            make.right.equalTo(self.titleLabel.snp.right)
            make.bottom.equalTo(-8)
        }
    }
    
    func setup(with list:ListViewModel) {
        self.titleLabel.text = list.title
        self.messageLabel.text = list.message
    }
}
