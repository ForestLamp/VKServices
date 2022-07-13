//
//  Alert.swift
//  VKServices
//
//  Created by Alex Ch. on 13.07.2022.
//

import UIKit


extension UITableViewController {
   
    func showAlertError(text: String) {
        let alert = UIAlertController(title: nil, message: text, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
