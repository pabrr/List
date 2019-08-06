//
//  ListsService.swift
//  List
//
//  Created by Polina Abrosimova on 26/03/2019.
//  Copyright © 2019 Polina Abrosimova. All rights reserved.
//

import Foundation
import RealmSwift

class ListsService: ListsServiceProtocol {
    
    public static var shared = ListsService()
    
    func add(list: ListViewModel) {
    let listEntity = self.listEntity(from: list)
        try! Realm().write {
            try Realm().add(listEntity)
        }
    }
    
    func edit(list: ListViewModel) {
        do {
            let listEntity = ListEntity()
            listEntity.title = list.title
            listEntity.message = list.message
            listEntity.id = list.id
            try Realm().write {
                try Realm().add(listEntity, update: true)
            }
        } catch {
            print("error updating list")
        }
    }
    
    func getLists() -> [ListViewModel] {
        do {
            let lists = try Realm().objects(ListEntity.self)
            return lists.map({ListViewModel(with: $0)})
        } catch {
            print("error getting lists")
            return []
        }
    }
    
    func getList(with id: String) -> ListViewModel? {
        let lists = self.getLists()
        let listViewModel = lists.filter({$0.id == id}).first
        if let listViewModel = listViewModel {
            return listViewModel
        } else {
            print("list not found")
            return nil
        }
    }
    
    func deleteList(with id: String) {
        do {
            let list = try Realm().objects(ListEntity.self).filter({$0.id == id}).first
            if let list = list {
                try Realm().write {
                    try Realm().delete(list)
                }
            } else {
                print("list not found")
            }
        } catch {
            print("error deleting list")
        }
    }
    
    func listEntity(from listViewModel: ListViewModel) -> ListEntity {
        let listEntity = ListEntity()
        listEntity.id = listViewModel.id
        listEntity.title = listViewModel.title
        listEntity.message = listViewModel.message
        return listEntity
    }
}
