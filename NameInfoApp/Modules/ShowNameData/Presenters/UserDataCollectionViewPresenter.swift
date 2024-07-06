//
//  UserDataCollectionViewPresenter.swift
//  NameInfoApp
//
//  Created by Nikita Nikandrov on 04.07.2024.
//

import Foundation

protocol UserDataCollectionViewPresenterProtocol: AnyObject {
    var view: UserDataCollectionViewProtocol? { get set }
    func updateUserData(with data: [CellLabels])
}

class UserDataCollectionViewPresenter: UserDataCollectionViewPresenterProtocol {
    weak var view: UserDataCollectionViewProtocol?

    func updateUserData(with data: [CellLabels]) {
        view?.updateCells(with: data)
    }
}

