//
//  UserDataCVCell.swift
//  NameInfoApp
//
//  Created by Nikita Nikandrov on 13.06.2024.
//

import UIKit

class UserDataCVCell: UICollectionViewCell {
    static let reuseIdentifier = "UserDataCVCell"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    let dataLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(dataLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            dataLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            dataLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            dataLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            dataLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])
        
    }
    func configure(with userData: CellLabels) {
        titleLabel.text = userData.title
        dataLabel.text = userData.data
    }
}
