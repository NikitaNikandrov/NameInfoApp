//
//  ShowNameDataModuleBuilder.swift
//  NameInfoApp
//
//  Created by Nikita Nikandrov on 15.04.2024.
//

import UIKit

class ShowNameDataModuleBuilder {
    static func build(name: String,age: String, gender: String, nation: [NationData]) -> ShowNameDataViewController {
        let router = ShowNameDataRouter()
        let interactor = ShowNameDataInteractor(name: name, age: age, gender: gender, nation: nation)
        let viewController = ShowNameDataViewController()
        let presenter = ShowNameDataPresenter(router: router, interactor: interactor)
    
        viewController.presenter = presenter
        presenter.view = viewController as? any ShowNameDataViewProtocol
        interactor.presenter = presenter
        router.viewController = viewController
        
        return viewController
    }
}
