//
//  ShowNameDataPresenter.swift
//  NameInfoApp
//
//  Created by Nikita Nikandrov on 15.04.2024.
//

import Foundation

protocol ShowNameDataPresenterProtocol: AnyObject {
    func viewDidLoaded()
}

class ShowNameDataPresenter {
    weak var view: ShowNameDataViewProtocol?
    var router: ShowNameDataRouterProtocol
    var interactor: ShowNameDataInteractorProtocol
    
    init(router: ShowNameDataRouterProtocol, interactor: ShowNameDataInteractorProtocol) {
        self.router = router
        self.interactor = interactor
    }
}

extension ShowNameDataPresenter: ShowNameDataPresenterProtocol {
    func viewDidLoaded() {
        let age = interactor.getAgeValue()
        let gender = interactor.getGenderValue()
        let nation = interactor.getNationValue()
        
        self.view?.showDataOfName(age: age, gender: gender, nation: nation)
    }
}
