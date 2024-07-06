//
//  NameView.swift
//  NameInfoApp
//
//  Created by Nikita Nikandrov on 02.05.2024.
//

import UIKit

class NameView: UIView {
    let nameTextField = UITextField()
    private let searchNameDatabutton = UIButton()
    
    var buttonAction: (()->Void)?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.backgroundColor = .clear
        setupNameTextField()
        setupSearchNameDataButton()
    }
    
    private func setupNameTextField() {
        self.addSubview(nameTextField)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.placeholder = "Enter name here"
        nameTextField.textAlignment = .center
        nameTextField.layer.borderWidth = 1.0
        nameTextField.layer.cornerRadius = 5.0
        nameTextField.layer.borderColor = UIColor.black.cgColor
        
        nameTextField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        nameTextField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -50).isActive = true
        nameTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setupSearchNameDataButton() {
        self.addSubview(searchNameDatabutton)
        searchNameDatabutton.translatesAutoresizingMaskIntoConstraints = false
        searchNameDatabutton.setTitle("Search name data", for: .normal)
        searchNameDatabutton.setTitleColor(.white, for: .normal)
        searchNameDatabutton.backgroundColor = .lightGray
        searchNameDatabutton.layer.cornerRadius = 5.0
        searchNameDatabutton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        searchNameDatabutton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        searchNameDatabutton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 50).isActive = true
        searchNameDatabutton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        searchNameDatabutton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func buttonTapped() {
        buttonAction?()
    }
}


