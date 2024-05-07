//
//  NationService.swift
//  NameInfoApp
//
//  Created by Nikita Nikandrov on 14.04.2024.
//

import Foundation

protocol NationServiceProtocol: AnyObject {
    func loadNation(name: String, completion: @escaping (Result<[Country], Error>) -> Void)
}

class NationService: NationServiceProtocol {
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func loadNation(name: String, completion: @escaping (Result<[Country], Error>) -> Void) {
        let ageQueryItems: [URLQueryItem] = [ URLQueryItem(name: "name", value: name) ]
        let endpoint = Endpoint(sheme: "https",
                                host: "api.genderize.io",
                                path: "/",
                                queryItems: ageQueryItems,
                                httpMethod: "GET",
                                headers: nil,
                                body: nil)
        
        networkService.request(from: endpoint) { (result: Result<NationServiceModelResponse, Error>) in
            switch result {
            case .success(let response):
                completion(.success(response.country))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
