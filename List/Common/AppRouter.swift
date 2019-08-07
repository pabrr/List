//
//  AppRouter.swift
//  List
//
//  Created by Polina Abrosimova on 28/02/2019.
//  Copyright © 2019 Polina Abrosimova. All rights reserved.
//

import Foundation
import UIKit

class AppRouter {
    public static var shared: AppRouter = AppRouter()
    
    func showAddList(from viewController: UIViewController, with type: WatchListType, with listId: String) {
        let addListViewController = AddListViewController(with: type, listId: listId)
        viewController.navigationController?.pushViewController(addListViewController, animated: true)
    }
}
