//
//  NamePresenter.swift
//  NameInfoApp
//
//  Created by Nikita Nikandrov on 14.04.2024.
//

import Foundation

protocol NamePresenterViewProtocol: AnyObject {
    func viewDidLoaded()
    func searchButtonClicked(with name: String)
}

protocol NamePresenterInteractorProtocol: AnyObject {
    func didReceieveDataOfName(name: String, age: String, gender: String,nation: [NationData])
}

class NamePresenter{
    weak var view: NameViewProtocol?
    var router: NameRouterProtocol
    var interactor: NameInteractorProtocol
    
    init(router: NameRouterProtocol, interactor: NameInteractorProtocol) {
        self.router = router
        self.interactor = interactor
        interactor.presenter = self
    }
}

extension NamePresenter: NamePresenterViewProtocol {
    func viewDidLoaded() {
        //Start loading info
    }
    
    func searchButtonClicked(with name: String) {
        self.view?.showActivityIndicator()
        interactor.fetchDataOfName(name: name) { age, gender, nations in
            self.router.showNameData(name: name, age: age, gender: gender, nation: nations)
        }
    }
}

extension NamePresenter: NamePresenterInteractorProtocol {
    func didReceieveDataOfName(name: String, age: String, gender: String, nation: [NationData]) {
        self.router.showNameData(name: name, age: age, gender: gender, nation: nation)
    }
}
