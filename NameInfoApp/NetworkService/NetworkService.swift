//
//  NetworkService.swift
//  NameInfoApp
//
//  Created by Nikita Nikandrov on 20.04.2024.
//

import Foundation

protocol NetworkServiceProtocol {
    func request<T: Decodable>(from endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void)
}

struct Endpoint {
    let sheme: String
    let host: String
    let path: String
    let queryItems: [URLQueryItem]?
    let httpMethod: String
    let headers: [String: String]?
    let body: Data?
}

class NetworkService: NetworkServiceProtocol {
    func request<T: Decodable>(from endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void) {
        var components = URLComponents()
        components.scheme = endpoint.sheme
        components.host = endpoint.host
        components.path = endpoint.path
        components.queryItems = endpoint.queryItems
        
        guard let requestString = components.string else {
            completion(.failure(NetworkServiceError.urlCreateError))
            return
        }
        
        guard let requestURL = URL(string: requestString) else {
            completion(.failure(NetworkServiceError.urlCreateError))
            return
        }
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = endpoint.httpMethod
        request.allHTTPHeaderFields = endpoint.headers
        request.httpBody = endpoint.body
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkServiceError.invalidData))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(NetworkServiceError.invalidResponse))
                return
            }
            
            guard (200..<300).contains(httpResponse.statusCode) else {
                completion(.failure(NetworkServiceError.invalidStatusCode(httpResponse.statusCode)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(T.self, from: data)
                completion(.success(decodedResponse))
            } catch {
                completion(.failure(NetworkServiceError.decodeError))
            }
            
        }.resume()
    }
}

enum NetworkServiceError: Error {
    case urlCreateError
    case invalidData
    case invalidResponse
    case invalidStatusCode(Int)
    case decodeError
}

