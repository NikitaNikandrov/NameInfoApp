//
//  ViewController.swift
//  NameInfoApp
//
//  Created by Nikita Nikandrov on 14.04.2024.
//

import UIKit

class NameViewController: UIViewController {
    private let nameTextField: UITextField = {
        var textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
                                                            string: "Searching name",
                                                            attributes: [NSAttributedString.Key.foregroundColor:    UIColor.systemGray,
                                                                         .font: UIFont.systemFont(ofSize: 18, weight: .regular)])
        textField.backgroundColor = UIColor.white
        textField.textColor = UIColor.black
        textField.layer.borderWidth = 2.0
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.cornerRadius = 20
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.systemBlue
        button.setTitle("Search", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        button.titleLabel?.textColor = .white
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.addTarget(self, action: #selector(), for: .touchUpInside)
        return button
    }()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

