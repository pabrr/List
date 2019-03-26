//
//  ListsViewController.swift
//  List
//
//  Created by Polina Abrosimova on 28/02/2019.
//  Copyright © 2019 Polina Abrosimova. All rights reserved.
//

import UIKit

import SnapKit

class ListsViewController: BaseViewController {
    
    var lists: [ListViewModel] = []
    
    var listsTableView: UITableView = UITableView()

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
    
    func initData() {
        self.lists = ListsService.shared.getLists()
        
        self.listsTableView.reloadData()
    }
    
    // Mark: UI events
    @objc func addList() {
        AppRouter.shared.showAddList(from: self)
    }
}

extension ListsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ListTableViewCell(style: .default, reuseIdentifier: ListTableViewCell.cellID)
        let list = self.lists[indexPath.row]
        cell.setup(with: list)
        return cell
    }
}
