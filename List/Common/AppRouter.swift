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
    
    func showAddList(from viewController: UIViewController) {
        let addListViewController = AddListViewController()
        viewController.navigationController?.pushViewController(addListViewController, animated: true)
    }
}
