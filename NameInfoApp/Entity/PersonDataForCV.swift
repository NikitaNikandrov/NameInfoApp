//
//  PersonDataForCV.swift
//  NameInfoApp
//
//  Created by Nikita Nikandrov on 10.06.2024.
//

import Foundation

struct PersonDataForCV {
    var age: Int
    var gander: String
    var nation: [NationVariants]
}

struct NationVariants {
    var country: String
    var probability: Float
}
