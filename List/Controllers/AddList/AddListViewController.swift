//
//  AddListViewController.swift
//  List
//
//  Created by Polina Abrosimova on 28/02/2019.
//  Copyright © 2019 Polina Abrosimova. All rights reserved.
//

import Foundation
import UIKit

class AddListViewController: BaseViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()
    
    var titleTextField: BaseTextField = BaseTextField()
    var messageTextView: UITextView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initView()
    }
    
    func initView() {
        self.title = "Add List"
        
        self.setupViews()
        self.setupNavigationBar()
    }
    
    func setupNavigationBar() {
        let addItemBarItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(addListItem))
        self.navigationItem.rightBarButtonItem = addItemBarItem
        
        self.navigationItem.hidesBackButton = true
        let backButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backBarButtonPressed))
        self.navigationItem.leftBarButtonItem = backButtonItem
    }
    
    func setupViews() {
        self.view.addSubview(self.scrollView)
        self.scrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.scrollView.addSubview(self.titleTextField)
        self.titleTextField.placeholder = "Title"
        self.titleTextField.snp.makeConstraints { (make) in
            make.top.equalTo(8)
            make.left.equalTo(10)
            make.right.equalTo(self.view)
            make.height.equalTo(44)
        }
        
        let messageLabel = UILabel()
        messageLabel.text = "Message:"
        self.scrollView.addSubview(messageLabel)
        messageLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleTextField.snp.bottom).inset(-8)
            make.left.equalTo(self.titleTextField.snp.left)
            make.right.equalTo(self.titleTextField.snp.right)
        }
        
        self.messageTextView.font = messageLabel.font
        self.scrollView.addSubview(self.messageTextView)
        self.messageTextView.snp.makeConstraints { (make) in
            make.top.equalTo(messageLabel.snp.bottom).inset(-5)
            make.left.equalTo(self.titleTextField.snp.left)
            make.right.equalTo(self.titleTextField.snp.right)
            make.height.equalTo(100)
        }
    }
    
    // MARK: UI events
    
    @objc func addListItem() {
        let title = titleTextField.text ?? ""
        let message = messageTextView.text ?? ""
        let listViewModel = ListViewModel(title: title, message: message)
        ListsService.shared.add(list: listViewModel)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func backBarButtonPressed() {
        let title = "Are you sure you wish to leave the screen?"
        let message = "Click again to confirm"
        
        let quitAction = UIAlertAction(title: "Quit", style: .default) { (_) in
            self.navigationController?.popViewController(animated: true)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        self.showAlert(with: title, message: message, alertActions: [quitAction, cancelAction])
    }
}
