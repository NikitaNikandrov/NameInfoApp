//
//  NameRouter.swift
//  NameInfoApp
//
//  Created by Nikita Nikandrov on 14.04.2024.
//

import Foundation

protocol NameRouterProtocol: AnyObject {
    func showNameData(age: String, gender: String, nation: [NationData])
}

class NameRouter: NameRouterProtocol {
    weak var viewController: NameViewController?
    
    func showNameData(age: String, gender: String, nation: [NationData]) {
        let vc = ShowNameDataModuleBuilder.build(age: age, gender: gender, nation: nation)
        viewController?.present(vc, animated: true, completion: nil)
    }
}
