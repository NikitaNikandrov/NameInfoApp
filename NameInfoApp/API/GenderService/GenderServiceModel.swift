//
//  GenderServiceModel.swift
//  NameInfoApp
//
//  Created by Nikita Nikandrov on 20.04.2024.
//

import Foundation

struct GenderServiceModelResponse: Codable {
    let count: Int
    let name: String
    let gender: String
    let probability: Float
}
