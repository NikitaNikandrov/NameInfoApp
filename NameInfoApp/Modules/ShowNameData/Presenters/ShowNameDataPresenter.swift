//
//  ShowNameDataPresenter.swift
//  NameInfoApp
//
//  Created by Nikita Nikandrov on 15.04.2024.
//

import Foundation

protocol ShowNameDataPresenterProtocol: AnyObject {
    func viewDidLoaded()
    func fetchUserData()
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
        fetchUserData()
    }
    
    func fetchUserData() {
        let name = interactor.getNameForTitle()
        let age = interactor.getAgeValue()
        let gender = interactor.getGenderValue()
        let nation = interactor.getNationValue()
        
        var userDataCells: [CellLabels] = []
        
        let ageCell = CellLabels(title: "Age:", data: age)
        userDataCells.append(ageCell)
        
        let genderCell = CellLabels(title: "Gender:", data: gender)
        userDataCells.append(genderCell)
        
        for item in nation {
            let nationCell = CellLabels(title: item.countryName, data: String(item.probability))
            userDataCells.append(nationCell)
        }
        self.view?.setHeaderTitle(title: name)
        self.view?.updateCollectionView(with: userDataCells)
    }
}
