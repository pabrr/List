//
//  ToTrashTableViewCell.swift
//  List
//
//  Created by Pabr on 19.06.2019.
//  Copyright © 2019 Polina Abrosimova. All rights reserved.
//

import UIKit

class ToTrashTableViewCell: UITableViewCell, BaseTableViewCellProtocol {
    static var cellID: String = NSStringFromClass(ToTrashTableViewCell.self)
    
    var titleLabel = UILabel(withFontSize: 16)
    var messageLabel = UILabel(withFontSize: 14)
    var dateTillTrashLabel = UILabel(withFontSize: 15)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.setupTitle()
        self.setupMessage()
        self.setupDateTillTrash()
    }
    
    private func setupTitle() {
        self.contentView.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(8)
            make.left.equalTo(16)
            make.right.equalTo(-8)
        }
    }
    
    private func setupMessage() {
        self.contentView.addSubview(self.messageLabel)
        self.messageLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleLabel.snp.bottom).inset(-6)
            make.left.equalTo(self.titleLabel.snp.left)
            make.bottom.equalTo(-8)
        }
    }
    
    private func setupDateTillTrash() {
        self.dateTillTrashLabel.textAlignment = .right
        
        self.contentView.addSubview(self.dateTillTrashLabel)
        self.dateTillTrashLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.messageLabel)
            make.right.equalTo(-8)
            make.bottom.equalTo(self.messageLabel)
            make.left.equalTo(self.messageLabel.snp.right).inset(-6)
        }
    }
    
    func setup(with viewModel: ToTrashViewModel) {
        self.titleLabel.text = viewModel.title
        self.messageLabel.text = viewModel.message
        self.dateTillTrashLabel.text = viewModel.daysRemain()
    }
}
