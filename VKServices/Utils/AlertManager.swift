//
//  AlertManager.swift
//  VKServices
//
//  Created by Alex Ch. on 13.07.2022.
//

import UIKit

class AlertManager {

    static func showAlertError(text: String) -> UIAlertController {
        let alert = UIAlertController(title: nil, message: text, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in }
        alert.addAction(action)
        return alert
    }
}
