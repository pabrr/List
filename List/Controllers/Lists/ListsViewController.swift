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
    
    var listsTableView = UITableView(frame: .zero)
    
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
        self.listsTableView.tableFooterView = UIView()
        
        self.listsTableView.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.cellID)
        
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
        AppRouter.shared.showAddList(from: self)
    }
}

extension ListsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let list = self.lists[indexPath.row]
        
        if let toTrashList = list as? ToTrashViewModel {
            let cell = self.listsTableView.dequeueReusableCell(withIdentifier: ToTrashTableViewCell.cellID, for: indexPath) as! ToTrashTableViewCell
            cell.setup(with: toTrashList)
            return cell
        }
        
        let cell = self.listsTableView.dequeueReusableCell(withIdentifier: ListTableViewCell.cellID, for: indexPath) as! ListTableViewCell
        cell.setup(with: list)
        return cell
    }
}
