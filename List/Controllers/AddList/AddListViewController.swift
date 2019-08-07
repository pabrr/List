//
//  AddListViewController.swift
//  List
//
//  Created by Polina Abrosimova on 28/02/2019.
//  Copyright © 2019 Polina Abrosimova. All rights reserved.
//

import Foundation
import UIKit

enum WatchListType: String {
    case add = "Add", edit = "Edit"
}

class AddListViewController: BaseViewController {
    
    var type: WatchListType?
    var list: ListViewModel?
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()
    
    var titleTextField: BaseTextField = BaseTextField()
    var messageTextView: UITextView = UITextView()
    
    init(with type: WatchListType, listId: String) {
        super.init(nibName: nil, bundle: nil)
        
        self.type = type
        if (type != .add) {
            self.list = ListsService.shared.getList(with: listId)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if self.type == .add {
            self.messageTextView.becomeFirstResponder()
        }
    }
    
    func initView() {
        self.title = "\(self.type?.rawValue ?? "") List"
        
        self.initViews()
        self.setupViews()
        self.setupNavigationBar()
    }
    
    func setupNavigationBar() {
        var rightBarItems: [UIBarButtonItem] = []
        let saveItemBarItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveListItem))
        rightBarItems.append(saveItemBarItem)
        
        if (self.type == .edit) {
            let deleteItemBarItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteListItem))
            rightBarItems.append(deleteItemBarItem)
        }
        
        self.navigationItem.rightBarButtonItems = rightBarItems
        
        self.navigationItem.hidesBackButton = true
        let backButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backBarButtonPressed))
        self.navigationItem.leftBarButtonItem = backButtonItem
    }
    
    func initViews() {
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
            make.bottom.equalTo(self.view.snp.bottom).inset(350)
        }
    }
    
    func setupViews() {
        if let existingList = self.list {
            self.titleTextField.text = existingList.title
            self.messageTextView.text = existingList.message
        }
    }
    
    // MARK: UI events
    
    @objc func saveListItem() {
        let title = titleTextField.text ?? ""
        let message = messageTextView.text ?? ""
        let listViewModel = ListViewModel(with: title, message: message)

        switch self.type! {
        case .add:
            self.add(listViewModel)
        case .edit:
            listViewModel.id = self.list!.id
            self.edit(listViewModel)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func add(_ listViewModel: ListViewModel) {
        ListsService.shared.add(list: listViewModel)
    }
    
    func edit(_ listViewModel: ListViewModel) {
        ListsService.shared.edit(list: listViewModel)
    }
    
    @objc func deleteListItem() {
        if let list = self.list {
            ListsService.shared.deleteList(with: list.id)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func backBarButtonPressed() {
        if (hasUnsavedChanges()) {
            let title = "Are you sure you wish to leave the screen?"
            let message = "Click again to confirm"
            
            let quitAction = UIAlertAction(title: "Quit", style: .default) { (_) in
                self.navigationController?.popViewController(animated: true)
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            self.showAlert(with: title, message: message, alertActions: [quitAction, cancelAction])
            return
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func hasUnsavedChanges() -> Bool {
        let listTitle = self.titleTextField.text
        let listMessage = self.messageTextView.text
        
        switch self.type! {
        case .add:
            return listTitle!.count > 0 || listMessage!.count > 0
        case .edit:
            return listTitle != self.list?.title || listMessage != self.list?.message
        }
    }
}
