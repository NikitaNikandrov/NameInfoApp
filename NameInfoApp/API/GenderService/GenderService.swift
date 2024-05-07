//
//  GenderService.swift
//  NameInfoApp
//
//  Created by Nikita Nikandrov on 14.04.2024.
//

import Foundation

protocol GenderServiceProtocol: AnyObject {
    func loadGender(name: String, completion: @escaping (Result<String, Error>) -> Void)
}

class GenderService: GenderServiceProtocol {
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func loadGender(name: String, completion: @escaping (Result<String, Error>) -> Void) {
        let ageQueryItems: [URLQueryItem] = [ URLQueryItem(name: "name", value: name) ]
        let endpoint = Endpoint(sheme: "https",
                                host: "api.genderize.io",
                                path: "/",
                                queryItems: ageQueryItems,
                                httpMethod: "GET",
                                headers: nil,
                                body: nil)
        
        networkService.request(from: endpoint) { (result: Result<GenderServiceModelResponse, Error>) in
            switch result {
            case .success(let response):
                completion(.success(response.gender))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
