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
        let ageService = AgeService(networkService: NetworkService())
        let genderService = GenderService(networkService: NetworkService())
        let nationService = NationService(networkService: NetworkService())
        let interactor = NameInteractor(ageService: ageService,
                                        genderService: genderService,
                                        nationService: nationService)
        let presenter = NamePresenter(router: router, interactor: interactor)
        let viewController = NameViewController()
        viewController.presenter = presenter
        presenter.view = viewController as? any NameViewProtocol
        interactor.presenter = presenter
        router.viewController = viewController
        
        return viewController
    }
}
