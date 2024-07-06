//
//  NameInteractor.swift
//  NameInfoApp
//
//  Created by Nikita Nikandrov on 14.04.2024.
//

import Foundation

protocol NameInteractorProtocol: AnyObject {
    var presenter: NamePresenterInteractorProtocol? { get set }
    func fetchDataOfName(name: String, completion: @escaping (String, String, [NationData]) -> Void)
}

class NameInteractor: NameInteractorProtocol {
    weak var presenter: NamePresenterInteractorProtocol?
    let ageService: AgeServiceProtocol?
    let genderService: GenderServiceProtocol?
    let nationService: NationServiceProtocol?
    
    init(ageService: AgeServiceProtocol, genderService: GenderServiceProtocol, nationService: NationServiceProtocol) {
        self.ageService = ageService
        self.genderService = genderService
        self.nationService = nationService
    }
    
    func fetchDataOfName(name: String, completion: @escaping (String, String, [NationData]) -> Void) {
        let group = DispatchGroup()
        var age = "default age"
        var gender = "default gender"
        var nations: [NationData] = []

        group.enter()
        DispatchQueue.global().async {
            group.enter()
            self.ageService?.loadAge(name: name, completion: { result in
                switch result {
                case .success(let ageResult):
                    age = ageResult
                case .failure(let error):
                    age = "Age load error: \(error)"
                }
                group.leave()
            })
            
            group.enter()
            self.genderService?.loadGender(name: name, completion: { result in
                switch result {
                case .success(let genderResult):
                    gender = genderResult
                case .failure(let error):
                    gender = "Gender load error: \(error)"
                }
                group.leave()
            })
            
            group.enter()
            self.nationService?.loadNation(name: name, completion: { result in
                switch result {
                case .success(let countries):
                    for item in countries {
                        var nation = NationData()
                        nation.countryName = item.countryID
                        nation.probability = item.probability
                        nations.append(nation)
                    }
                case .failure(let error):
                    var failNation = NationData()
                    failNation.countryName = "Nation load error: \(error)"
                    nations.append(failNation)
                }
                group.leave()
            })
            
            group.notify(queue: .main) {
                completion(age, gender, nations)
            }
            
            group.leave()
        }
    }
}
