//
//  ShowNameDataViewController.swift
//  NameInfoApp
//
//  Created by Nikita Nikandrov on 15.04.2024.
//

import UIKit

protocol ShowNameDataViewProtocol: AnyObject {
    func showDataOfName(age: String?, gender: String?, nation: String?)
}

class ShowNameDataViewController: UIViewController {
    var presenter: ShowNameDataPresenterProtocol?
    
    var ageValueLabel: UILabel?
    var genderValueLabel: UILabel?
    var nationValueLabel: UILabel?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoaded()
    }
}

extension ShowNameDataViewController: ShowNameDataViewProtocol {
    func showDataOfName(age: String?, gender: String?, nation: String?) {
        DispatchQueue.main.async {
            self.ageValueLabel?.text = age
            self.genderValueLabel?.text = gender
            self.nationValueLabel?.text = nation
        }
    }
}
