//
//  NameRouter.swift
//  NameInfoApp
//
//  Created by Nikita Nikandrov on 14.04.2024.
//

import Foundation

protocol NameRouterProtocol: AnyObject {
    
}

class NameRouter {
    weak var viewController: NameViewController?
}

extension NameRouter: NameRouterProtocol {
    
}
