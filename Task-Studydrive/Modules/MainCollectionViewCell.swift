//
//  MainCollectionViewCell.swift
//  Task-Studydrive
//
//  Created by Faraz Ahmed Khan on 08/08/2022.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MainCollectionViewCell"
    
    fileprivate lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.backgroundColor = .clear
        l.textAlignment = .center
        l.textColor = .white
        l.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return l
    }()
    
    fileprivate func setupViews() {
        contentView.layer.cornerRadius = 15
        contentView.backgroundColor = .gray
        contentView.addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
    }
    
    func configureCell(text: String) {
        titleLabel.text = text
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
}
