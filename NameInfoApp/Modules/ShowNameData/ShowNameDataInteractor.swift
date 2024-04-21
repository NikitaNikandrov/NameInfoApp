//
//  ShowNameDataInteractor.swift
//  NameInfoApp
//
//  Created by Nikita Nikandrov on 15.04.2024.
//

import Foundation

protocol ShowNameDataInteractorProtocol: AnyObject {
    func getAgeValue() -> String
    func getGenderValue() -> String
    func getNationValue() -> String
}

class ShowNameDataInteractor {
    weak var presenter: ShowNameDataPresenterProtocol?
    
    let age: String
    let gender: String
    let nation: String
    
    init(age: String, gender: String, nation: String) {
        self.age = age
        self.gender = gender
        self.nation = nation
    }
}

extension ShowNameDataInteractor: ShowNameDataInteractorProtocol {
    func getAgeValue() -> String {
        return self.age
    }
    
    func getGenderValue() -> String {
        return self.gender
    }
    
    func getNationValue() -> String {
        return self.nation
    }
}
