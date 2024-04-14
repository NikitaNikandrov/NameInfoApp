//
//  NameInteractor.swift
//  NameInfoApp
//
//  Created by Nikita Nikandrov on 14.04.2024.
//

import Foundation

protocol NameInteractorProtocol: AnyObject {
    func loadAgeData()
    func loadGenderData()
    func loadNationData()
}

class NameInteractor {
    weak var presenter: NamePresenterProtocol?
    let ageService: AgeServiceProtocol?
    let genderService: GenderServiceProtocol?
    let nationService: NationServiceProtocol?
    
    init(ageService: AgeServiceProtocol, genderService: GenderServiceProtocol, nationService: NationServiceProtocol) {
        self.ageService = ageService
        self.genderService = genderService
        self.nationService = nationService
    }
}

extension NameInteractor: NameInteractorProtocol {
    func loadAgeData() {
        ageService?.loadAge(name: "", completion: { [weak self] age in
            self?.presenter?.ageDidLoaded(age: age)
        })
    }
    
    func loadGenderData() {
        genderService?.loadGender(name: "", completion: { [weak self] gender in
            self?.presenter?.genderDidLoaded(gender: gender)
        })
    }
    
    func loadNationData() {
        nationService?.loadNation(name: "", completion: { [weak self] nation in
            self?.presenter?.nationDidLoaded(nation: nation)
        })
    }
}
