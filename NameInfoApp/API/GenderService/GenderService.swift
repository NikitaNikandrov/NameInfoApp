//
//  GenderService.swift
//  NameInfoApp
//
//  Created by Nikita Nikandrov on 14.04.2024.
//

import Foundation

protocol GenderServiceProtocol: AnyObject {
    func loadGender(name: String, completion: @escaping (String) -> Void)
}

class GenderService: GenderServiceProtocol {
    func loadGender(name: String, completion: @escaping (String) -> Void) {
        
    }
}
