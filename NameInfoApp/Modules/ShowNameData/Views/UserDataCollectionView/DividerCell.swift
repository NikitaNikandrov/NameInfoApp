//
//  DividerCell.swift
//  NameInfoApp
//
//  Created by Nikita Nikandrov on 07.07.2024.
//

import UIKit

class DividerCell: UICollectionViewCell {
    static let reuseIdentifier = "DividerCell"
    
    let dividerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //contentView.backgroundColor = .lightGray
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        contentView.addSubview(dividerLabel)
        
        NSLayoutConstraint.activate([
            dividerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            dividerLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            dividerLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])
    }
    
    func configure(with title: String) {
        self.dividerLabel.text = title
    }
}
