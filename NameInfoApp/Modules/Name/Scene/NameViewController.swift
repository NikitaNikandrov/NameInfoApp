//
//  ViewController.swift
//  NameInfoApp
//
//  Created by Nikita Nikandrov on 14.04.2024.
//

import UIKit

protocol NameViewProtocol: AnyObject {
}

class NameViewController: UIViewController {
    var presenter: NamePresenterViewProtocol?
    
    private lazy var nameView = NameView()
    
    private func searchButtonClicked() {
        guard let searchingName = self.nameView.nameTextField.text else {
            return
        }
        presenter?.searchButtonClicked(with: searchingName)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        setupNameView()
        hideKeyBoardWithTap()
    }
    
    private func setupViewController() {
        view.backgroundColor = .white
    }
    
    func setupNameView() {
        nameView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(nameView)
        
        nameView.buttonAction = { [weak self] in
            self?.searchButtonClicked()
        }
        
        nameView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        nameView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        nameView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        nameView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    }
}

extension NameViewController {
    func hideKeyBoardWithTap() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
}
