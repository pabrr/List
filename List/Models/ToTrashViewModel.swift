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
    
    convenience init(with message: String, dateTillTrash: Date) {
        self.init(title: "Выбросить", message: message)

        self.dateTillTrash = dateTillTrash
    }
    
    func daysRemain() -> String {
        return "\(5) дней"
    }
}
