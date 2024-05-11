//
//  NationServiceModel.swift
//  NameInfoApp
//
//  Created by Nikita Nikandrov on 20.04.2024.
//

import Foundation

struct NationServiceModelResponse: Codable {
    let count: Int
    let name: String
    let country: [Country]
}

struct Country: Codable {
    let countryID: String
    let probability: Float

    enum CodingKeys: String, CodingKey {
        case countryID = "country_id"
        case probability
    }
}
