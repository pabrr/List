//
//  ToTrashViewModel.swift
//  List
//
//  Created by Pabr on 19.06.2019.
//  Copyright © 2019 Polina Abrosimova. All rights reserved.
//

import Foundation

class ToTrashViewModel: ListViewModel {
    var dateTillTrash: Date!
    
    convenience init(message: String, dateTillTrash: Date) {
        self.init(title: "Выбросить", message: message)

        self.dateTillTrash = dateTillTrash
    }
    
    convenience override init(with entity: ListEntity) {
        self.init(title: "Выбросить", message: entity.message)
        
        self.dateTillTrash = entity.dateTillTrash!
    }
    
    func daysRemain() -> String {
        return "\(5) дней"
    }
}
