//
//  ListsServiceProtocol.swift
//  List
//
//  Created by Polina Abrosimova on 26/03/2019.
//  Copyright © 2019 Polina Abrosimova. All rights reserved.
//

import Foundation

protocol ListsServiceProtocol {
    func add(list: ListViewModel)
    func getLists() -> [ListViewModel]
    func deleteList(with id: String)
}
