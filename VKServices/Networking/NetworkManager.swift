//
//  NetworkManager.swift
//  VKServices
//
//  Created by Alex Ch. on 13.07.2022.
//

import UIKit

protocol NetworkManagerDelegate: class {
    func showData(results: [Service])
    func showError()
}

final class NetworkManager {
    
    private let api = Api()
    weak var delegate: NetworkManagerDelegate?
    
    func fetchData(url: String) {
        api.decodeData(url: url) { [weak self] (result) in
            guard let self = self else {return}
            switch result {
            case .success(let service):
                DispatchQueue.main.async {
                    self.delegate?.showData(results: service?.body.services ?? [])
                }
            case .failure(_):
                self.delegate?.showError()
            }
        }
    }
    
    func openService(from url: String){
        if let url =  URL(string: url){
            UIApplication.shared.open(url)
        }
    }
}
