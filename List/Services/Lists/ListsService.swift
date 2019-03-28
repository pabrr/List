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
    
    var realm: Realm?
    
    init() {
        do {
            self.realm = try Realm()
        } catch {
            print("error initing Realm")
        }
    }
    
    func add(list: ListViewModel) {
        do {
            let realm = try Realm()
            let listEntity = ListEntity()
            listEntity.id = list.id
            listEntity.title = list.title
            listEntity.message = list.message
            try! realm.write {
                realm.add(listEntity)
            }
        } catch {
            print("error adding list")
        }
    }
    
    func getLists() -> [ListViewModel] {
        do {
            let realm = try Realm()
            let lists = realm.objects(ListEntity.self)
            return lists.map({ListViewModel(with: $0)})
        } catch {
            print("error getting lists")
            return []
        }
    }
    
    func deleteList(with id: String) {
        let list = self.realm?.objects(ListEntity.self).filter({$0.id == id}).first
        if let list = list {
            self.realm?.delete(list)
        } else {
            print("list not found")
        }
    }
}
