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
    
    convenience init(title:String, message:String) {
        self.init()
        
        self.title = title
        self.message = message
    }
}
