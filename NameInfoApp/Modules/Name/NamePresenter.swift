//
//  NamePresenter.swift
//  NameInfoApp
//
//  Created by Nikita Nikandrov on 14.04.2024.
//

import Foundation

protocol NamePresenterProtocol: AnyObject {
    func viewDidLoaded()
    func searchButtonClicked(with name: String)
    func ageDidLoaded()
    func genderDidLoaded()
    func nationDidLoaded()
}

class NamePresenter {
    weak var view: NameViewProtocol?
    var router: NameRouterProtocol
    var interactor: NameInteractorProtocol
    
    private var age: String?
    private var gender: String?
    private var nation: String?
    
    init(router: NameRouterProtocol, interactor: NameInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
}

extension NamePresenter: NamePresenterProtocol {
    func viewDidLoaded() {
        //Start loading info
    }
    
    func searchButtonClicked(with name: String) {
        //Parallels load, wait and return all data at one time
        interactor.loadAgeData(with: name)
        interactor.loadGenderData(with: name)
        interactor.loadNationData(with: name)
        
        router.showNameData(age: self.age ?? "",
                            gender: self.gender ?? "",
                            nation: self.nation ?? "")
    }
    
    func ageDidLoaded() {
        self.age = interactor.age
    }
    
    func genderDidLoaded() {
        self.gender = interactor.gender
    }
    
    func nationDidLoaded() {
        self.nation = interactor.nation
    }
}
