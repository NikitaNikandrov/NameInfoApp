//
//  ShowNameDataViewController.swift
//  NameInfoApp
//
//  Created by Nikita Nikandrov on 15.04.2024.
//

import UIKit

protocol ShowNameDataViewProtocol: AnyObject {
    func updateCollectionView(with data: [CellLabels])
    func setHeaderTitle(title: String)
}

class ShowNameDataViewController: UIViewController {
    var presenter: ShowNameDataPresenterProtocol?
    var userDataCollectionView: UserDataCollectionViewProtocol?
    var headerView: HeaderViewProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        setupHeaderView()
        setupUserDataCollectionView()
        self.presenter?.viewDidLoaded()
    }
    
    private func setupViewController() {
        view.backgroundColor = .white
    }
    
    private func setupHeaderView() {
        headerView = HeaderView()
        
        guard let headerView = headerView as? UIView else { return }
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(headerView)
        
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setupUserDataCollectionView() {
        userDataCollectionView = UserDataCollectionView()
        userDataCollectionView?.presenter = UserDataCollectionViewPresenter()
        userDataCollectionView?.presenter?.view = userDataCollectionView
        
        guard let userDataCollectionView = userDataCollectionView else { return }
        
        guard let userDataCollectionView = userDataCollectionView as? UIView else { return }
        userDataCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(userDataCollectionView)
        
        guard let headerView = headerView as? UIView else { return }
        NSLayoutConstraint.activate([
            userDataCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            userDataCollectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            userDataCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            userDataCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ShowNameDataViewController: ShowNameDataViewProtocol {
    func setHeaderTitle(title: String) {
        self.headerView?.setHeaderTitle(title)
    }
    
    func updateCollectionView(with data: [CellLabels]) {
        self.userDataCollectionView?.updateCells(with: data)
        self.userDataCollectionView?.reloadDataCollectionView()
    }
}
