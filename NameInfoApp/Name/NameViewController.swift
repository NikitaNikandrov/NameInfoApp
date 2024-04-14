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
    var presenter: NamePresenterProtocol?
    
    @objc func searchButtonClicked() {
      
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoaded()
    }
}

extension NameViewController: NameViewProtocol {
    
}
