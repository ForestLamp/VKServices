//
//  Model.swift
//  VKServices
//
//  Created by Alex Ch. on 12.07.2022.
//

import Foundation

struct AllData: Decodable {
    let body: Results
}

// MARK: - Results
struct Results: Decodable {
    let services: [Service]
}

// MARK: - Service
struct Service: Decodable {
    let name, serviceDescription: String
    let link: String
    let iconURL: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case serviceDescription = "description"
        case link
        case iconURL = "icon_url"
    }
}
