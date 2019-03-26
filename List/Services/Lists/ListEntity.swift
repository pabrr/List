//
//  ListEntity.swift
//  List
//
//  Created by Polina Abrosimova on 26/03/2019.
//  Copyright © 2019 Polina Abrosimova. All rights reserved.
//

import Foundation
import RealmSwift

class ListEntity: Object {
    @objc dynamic var title = ""
    @objc dynamic var message = ""
}
