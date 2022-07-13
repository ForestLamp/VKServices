//
//  Model.swift
//  VKServices
//
//  Created by Alex Ch. on 12.07.2022.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let body: Body
    let status: Int
}

// MARK: - Body
struct Body: Codable {
    let services: [Service]
}

// MARK: - Service
struct Service: Codable {
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
