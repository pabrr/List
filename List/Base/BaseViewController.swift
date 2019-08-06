//
//  BaseViewController.swift
//  List
//
//  Created by Polina Abrosimova on 28/02/2019.
//  Copyright © 2019 Polina Abrosimova. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.baseInit()
    }
    
    func baseInit() {
        self.view.backgroundColor = .white
        
        self.setupKeyboard()
    }
    
    func setupKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(_:)))
        self.view.addGestureRecognizer(tap)
    }
    
    func showAlert(with title: String, message: String, alertActions:[UIAlertAction]) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for alertAction in alertActions.reversed() {
            alertController.addAction(alertAction)
        }
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: UI events
    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
}
