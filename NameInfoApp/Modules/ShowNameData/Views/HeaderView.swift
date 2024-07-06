//
//  HeaderView.swift
//  NameInfoApp
//
//  Created by Nikita Nikandrov on 07.07.2024.
//

import UIKit

protocol HeaderViewProtocol: AnyObject {
    func setHeaderTitle(_ title: String)
}

class HeaderView: UIView {
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.backgroundColor = .lightGray
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(headerLabel)
        
        NSLayoutConstraint.activate([
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            headerLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}

extension HeaderView: HeaderViewProtocol {
    func setHeaderTitle(_ title: String) {
        self.headerLabel.text = title
    }
}
