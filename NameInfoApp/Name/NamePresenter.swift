//
//  NamePresenter.swift
//  NameInfoApp
//
//  Created by Nikita Nikandrov on 14.04.2024.
//

import Foundation

protocol NamePresenterProtocol: AnyObject {
    func viewDidLoaded()
    func searchButtonClicked()
    func ageDidLoaded(age: String?)
    func genderDidLoaded(gender: String?)
    func nationDidLoaded(nation: String?)
}

class NamePresenter {
    weak var view: NameViewProtocol?
    var router: NameRouterProtocol
    var interactor: NameInteractorProtocol
    
    init(router: NameRouterProtocol, interactor: NameInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
}

extension NamePresenter: NamePresenterProtocol {
    func viewDidLoaded() {
        //Start loading info
    }
    
    func searchButtonClicked() {
        //Parallels load, wait and return all data at one time
        interactor.loadAgeData()
        interactor.loadGenderData()
        interactor.loadNationData()
    }
    
    func ageDidLoaded(age: String?) {
        
    }
    
    func genderDidLoaded(gender: String?) {
        
    }
    
    func nationDidLoaded(nation: String?) {
        
    }
}
