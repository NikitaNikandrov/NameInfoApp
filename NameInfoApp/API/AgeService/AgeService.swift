//
//  AgeService.swift
//  NameInfoApp
//
//  Created by Nikita Nikandrov on 14.04.2024.
//

import Foundation

protocol AgeServiceProtocol: AnyObject {
    func loadAge(name: String, completion: @escaping (String) -> Void)
}

class AgeService: AgeServiceProtocol {
    func loadAge(name: String, completion: @escaping (String) -> Void) {
        
    }
}
