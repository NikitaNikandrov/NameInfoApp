//
//  ShowNameDataRouter.swift
//  NameInfoApp
//
//  Created by Nikita Nikandrov on 15.04.2024.
//

import Foundation

protocol ShowNameDataRouterProtocol: AnyObject {
}

class ShowNameDataRouter {
    weak var viewController: ShowNameDataViewController?
}

extension ShowNameDataRouter: ShowNameDataRouterProtocol {    
}
