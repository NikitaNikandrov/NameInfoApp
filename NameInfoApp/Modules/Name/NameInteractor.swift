//
//  NameInteractor.swift
//  NameInfoApp
//
//  Created by Nikita Nikandrov on 14.04.2024.
//

import Foundation

protocol NameInteractorProtocol: AnyObject {
    func loadAgeData(with name: String)
    func loadGenderData(with name: String)
    func loadNationData(with name: String)
    var age: String { get }
    var gender: String { get }
    var nation: String { get }
}

class NameInteractor: NameInteractorProtocol {
    weak var presenter: NamePresenterProtocol?
    let ageService: AgeServiceProtocol?
    let genderService: GenderServiceProtocol?
    let nationService: NationServiceProtocol?
    
    var age: String = ""
    var gender: String = ""
    var nation: String = ""
    
    init(ageService: AgeServiceProtocol, genderService: GenderServiceProtocol, nationService: NationServiceProtocol) {
        self.ageService = ageService
        self.genderService = genderService
        self.nationService = nationService
    }
    
    func loadAgeData(with name: String) {
        ageService?.loadAge(name: name, completion: { [weak self] age in
            self?.age = age
            self?.presenter?.ageDidLoaded()
        })
    }
    
    func loadGenderData(with name: String) {
        genderService?.loadGender(name: name, completion: { [weak self] gender in
            self?.gender = gender
            self?.presenter?.genderDidLoaded()
        })
    }
    
    func loadNationData(with name: String) {
        nationService?.loadNation(name: name, completion: { [weak self] nation in
            self?.nation = nation
            self?.presenter?.nationDidLoaded()
        })
    }
}
