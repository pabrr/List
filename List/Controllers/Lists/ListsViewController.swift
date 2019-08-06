//
//  ListsViewController.swift
//  List
//
//  Created by Polina Abrosimova on 28/02/2019.
//  Copyright © 2019 Polina Abrosimova. All rights reserved.
//

import UIKit

import SnapKit

class ListsViewController: UIViewController {
    
    var lists: [ListViewModel] = []
    
    var listsTableView = UITableView(with: 0)
    
    var emptyListsLabel: UILabel = {
        let label = UILabel(withFontSize: 18)
        label.text = "There are no lists yet"
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.initView()
        self.initData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.initData()
    }
    
    func initView() {
        self.setupNavigationBar()
        self.initTableView()
        self.initEmptyLabel()
    }
    
    func setupNavigationBar() {
        self.title = "Lists"
        
        let addListBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addList))
        self.navigationItem.rightBarButtonItem = addListBarButton
    }
    
    func initTableView() {
        self.view.addSubview(self.listsTableView)
        self.listsTableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.listsTableView.delegate = self
        self.listsTableView.dataSource = self
    }
    
    func initEmptyLabel() {
        self.view.insertSubview(self.emptyListsLabel, at: 1)
        self.emptyListsLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.left.equalTo(24)
            make.right.equalTo(-24)
        }
        self.emptyListsLabel.isHidden = true
    }
    
    func initData() {
        self.lists = ListsService.shared.getLists()
        
        self.listsTableView.reloadData()
        self.emptyListsLabel.isHidden = self.lists.count > 0
    }
    
    // Mark: UI events
    @objc func addList() {
        AppRouter.shared.showAddList(from: self, with: .add, with: "")
    }
}

extension ListsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ListTableViewCell(style: .default, reuseIdentifier: ListTableViewCell.cellID)
        let list = self.lists[indexPath.row]
        cell.setup(with: list)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let list = self.lists[indexPath.row]
        AppRouter.shared.showAddList(from: self, with: .edit, with: list.id)
    }
}
