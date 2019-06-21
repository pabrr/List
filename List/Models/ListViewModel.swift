//
//  ListViewModel.swift
//  List
//
//  Created by Polina Abrosimova on 28/02/2019.
//  Copyright © 2019 Polina Abrosimova. All rights reserved.
//

import Foundation

class ListViewModel {
    var title = ""
    var message = ""
    
    init(title:String, message:String) {
        self.title = title
        self.message = message
    }
    
    init(with entity: ListEntity) {
        self.title = entity.title
        self.message = entity.message
    }
}
