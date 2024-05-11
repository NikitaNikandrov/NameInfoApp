//
//  AgeService.swift
//  NameInfoApp
//
//  Created by Nikita Nikandrov on 14.04.2024.
//

import Foundation

protocol AgeServiceProtocol: AnyObject {
    func loadAge(name: String, completion: @escaping (Result<String, Error>) -> Void)
}

class AgeService: AgeServiceProtocol {
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func loadAge(name: String, completion: @escaping (Result<String, Error>) -> Void) {
        let ageQueryItems: [URLQueryItem] = [ URLQueryItem(name: "name", value: name) ]
        let endpoint = Endpoint(sheme: "https",
                                host: "api.agify.io",
                                path: "/",
                                queryItems: ageQueryItems,
                                httpMethod: "GET",
                                headers: nil,
                                body: nil)
        networkService.request(from: endpoint) { (result: Result<AgeServiceModelResponse, Error>) in
            switch result {
            case .success(let response):
                let age = String(response.age)
                completion(.success(age))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
