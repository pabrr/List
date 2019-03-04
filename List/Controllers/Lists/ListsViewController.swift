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
        let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.cellID) as! ListTableViewCell
        let list = self.lists[indexPath.row]
        cell.setup(with: list)
        return cell
    }
}
