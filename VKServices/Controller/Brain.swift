//
//  Brain.swift
//  VKServices
//
//  Created by Alex Ch. on 14.07.2022.
//

import UIKit

final class Brain {
    
    func openService(from url: String){
        if let url =  URL(string: url){
            UIApplication.shared.open(url)
        }
    }
}
