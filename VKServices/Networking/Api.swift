//
//  Api.swift
//  VKServices
//
//  Created by Alex Ch. on 13.07.2022.
//

import Foundation

final class Api {
    
    let baseURL = "https://publicstorage.hb.bizmrg.com/sirius/result.json"
    
    func decodeData(url: String, completion: @escaping (Result<AllData?, Error>)-> Void) {
        guard let url = URL(string: url) else {return}
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Ошибка запроса: \(error)")
            }
            guard (response as? HTTPURLResponse)?.statusCode == 200,
                  let data = data else {return}
            do {
                let json = try JSONDecoder().decode(AllData.self, from: data)
                completion(.success(json))
            } catch let error {
                print("Ошибка парсинга: \(error)")
            }
        }.resume()
    }
}
