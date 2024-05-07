//
//  ShowNameDataModuleBuilder.swift
//  NameInfoApp
//
//  Created by Nikita Nikandrov on 15.04.2024.
//

import UIKit

class ShowNameDataModuleBuilder {
    static func build(age: String, gender: String, nation: [NationData]) -> ShowNameDataViewController {
        let router = ShowNameDataRouter()
        let interactor = ShowNameDataInteractor(age: age, gender: gender, nation: nation)
        let presenter = ShowNameDataPresenter(router: router, interactor: interactor)
        let viewController = ShowNameDataViewController()
        viewController.presenter = presenter
        presenter.view = viewController
        interactor.presenter = presenter
        router.viewController = viewController
        
        return viewController
    }
}
