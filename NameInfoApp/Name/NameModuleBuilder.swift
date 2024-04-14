//
//  NameModuleBuilder.swift
//  NameInfoApp
//
//  Created by Nikita Nikandrov on 14.04.2024.
//

import UIKit

class NameModuleBuilder {
    static func build() -> NameViewController {
        let router = NameRouter()
        let ageService = AgeService()
        let genderService = GenderService()
        let nationService = NationService()
        let interactor = NameInteractor(ageService: ageService,
                                        genderService: genderService,
                                        nationService: nationService)
        let presenter = NamePresenter(router: router, interactor: interactor)
        let viewController = NameViewController()
        viewController.presenter = presenter
        presenter.view = viewController
        interactor.presenter = presenter
        router.viewController = viewController
        
        return viewController
    }
}
