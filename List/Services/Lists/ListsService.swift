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
        do {
            let realm = try Realm()
            let listEntity = ListEntity()
            listEntity.title = list.title
            listEntity.message = list.message
            if let toTrashList = list as? ToTrashViewModel {
                listEntity.dateTillTrash = toTrashList.dateTillTrash
            }
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
            return lists.map({ (entity) -> ListViewModel in
                if entity.dateTillTrash != nil {
                    return ToTrashViewModel(with: entity)
                }
                return ListViewModel(with: entity)
            })
        } catch {
            print("error getting lists")
            return []
        }
    }
}
