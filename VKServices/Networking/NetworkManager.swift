//
//  NetworkManager.swift
//  VKServices
//
//  Created by Alex Ch. on 13.07.2022.
//

import Foundation

protocol NetworkManagerDelegate: AnyObject {
    func showData(results: [Service])
    func showError()
}

class NetworkManager {
    
    weak var delegate: NetworkManagerDelegate?
    
    func fetchData(url: String) {
        decodeData(url: url) { (result) in
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
    
    private func decodeData(url: String, completion: @escaping (Result<AllData?, Error>)-> Void) {
        guard let url = URL(string: url) else {return}
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Ошибка запроса: \(error)")
            }
            guard let data = data else {return}
            do {
                let json = try JSONDecoder().decode(AllData.self, from: data)
                completion(.success(json))
            } catch let error {
                print("Ошибка парсинга: \(error)")
            }
        }.resume()
    }
}







//    private func fetchData(){
//
//        let baseURL = api.baseURL
//        networkManager.fetchData(url: baseURL) { (result) in
//            switch result {
//            case .success(let service):
//                DispatchQueue.main.async {
//                    self.services = service?.body.services ?? []
//                    self.tableView.reloadData()
//                }
//            case .failure(_):
//                self.showAlertError(text: "Пожалуйста, проверьте соединение.")
//            }
//        }
//    }
