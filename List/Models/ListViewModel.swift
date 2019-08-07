//
//  ListViewModel.swift
//  List
//
//  Created by Polina Abrosimova on 28/02/2019.
//  Copyright © 2019 Polina Abrosimova. All rights reserved.
//

import Foundation

class ListViewModel {
    var id = ""
    var title = ""
    var message = ""
    
    convenience init(with title: String, message: String) {
        self.init()
        
        self.id = UUID().uuidString
        self.title = title
        self.message = message
    }
    
    convenience init(with listEntity: ListEntity) {
        self.init()
        
        self.id = listEntity.id
        self.title = listEntity.title
        self.message = listEntity.message
    }
}
