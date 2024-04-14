//
//  NationService.swift
//  NameInfoApp
//
//  Created by Nikita Nikandrov on 14.04.2024.
//

import Foundation

protocol NationServiceProtocol: AnyObject {
    func loadNation(name: String, completion: @escaping (String) -> Void)
}

class NationService: NationServiceProtocol {
    func loadNation(name: String, completion: @escaping (String) -> Void) {
        
    }
}
