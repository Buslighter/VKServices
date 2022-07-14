//
//  Model.swift
//  VKServices
//
//  Created by gleba on 14.07.2022.
//

import Foundation

// MARK: - Services
struct Answer: Codable {
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
//MARK: REWROTE CLASS
class Services{
    var name, serviceDescription: String?
    var link: String?
    var iconURL: String?
}
