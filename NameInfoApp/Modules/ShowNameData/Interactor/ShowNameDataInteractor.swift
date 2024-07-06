//
//  ShowNameDataInteractor.swift
//  NameInfoApp
//
//  Created by Nikita Nikandrov on 15.04.2024.
//

import Foundation

protocol ShowNameDataInteractorProtocol: AnyObject {
    func getNameForTitle() -> String
    func getAgeValue() -> String
    func getGenderValue() -> String
    func getNationValue() -> [NationData]
}

class ShowNameDataInteractor {
    weak var presenter: ShowNameDataPresenterProtocol?
    
    let name: String
    let age: String
    let gender: String
    let nation: [NationData]
    
    init(name: String, age: String, gender: String, nation: [NationData]) {
        self.name = name
        self.age = age
        self.gender = gender
        self.nation = nation
    }
}

extension ShowNameDataInteractor: ShowNameDataInteractorProtocol {
    func getNameForTitle() -> String {
        return self.name
    }
    
    func getAgeValue() -> String {
        return self.age
    }
    
    func getGenderValue() -> String {
        return self.gender
    }
    
    func getNationValue() -> [NationData] {
        return self.nation
    }
}
