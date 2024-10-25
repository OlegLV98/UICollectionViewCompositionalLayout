//
//  CollectionUsersCell.swift
//  HW10UIKit_LesnoyOleg
//
//  Created by Oleg Lesnoy on 03.05.2024.
//

import UIKit

final class CollectionUsersCell: UICollectionViewCell, SelfConfiguringCell {
    static let reuseId: String = "CollectionUsersCell"
    
    private lazy var avaImageView: UIImageView = {
        .config(view: $0) { view in
            view.clipsToBounds = true
            view.contentMode = .scaleAspectFill
            view.layer.cornerRadius = 25
            view.widthAnchor.constraint(equalToConstant: 50).isActive = true
            view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    }(UIImageView())
    
    private lazy var nameLabel = AppUI.createLabel(font: .systemFont(ofSize: 14, weight: .bold),
                                                   numberOfLines: 2, textAlignment: .center)
    
    private lazy var someTextLabel = AppUI.createLabel(font: .systemFont(ofSize: 14, weight: .medium),
                                                       textColor: #colorLiteral(red: 0.6606984735, green: 0.6606983542, blue: 0.6606983542, alpha: 1), numberOfLines: 0, textAlignment: .center)
    
    private lazy var writeButton: UIButton = {
        .config(view: $0) { view in
            view.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
            view.setTitleColor(#colorLiteral(red: 0, green: 0.568627451, blue: 1, alpha: 1), for: .normal)
            view.widthAnchor.constraint(equalToConstant: 70).isActive = true
            view.heightAnchor.constraint(equalToConstant: 17).isActive = true
        }
    }(UIButton())
    
    func setupCell(item: CollectionItem) {
        clipsToBounds = true
        layer.cornerRadius = 20
        backgroundColor = .white
        
        addSubview(avaImageView)
        addSubview(nameLabel)
        addSubview(someTextLabel)
        addSubview(writeButton)
        
        avaImageView.image = UIImage(named: "\(item.ava ?? "")")
        nameLabel.text = item.name
        someTextLabel.text = item.text
        writeButton.setTitle("\(item.buttonTitle ?? "")", for: .normal)
        
        setConstraints()
    }
}

extension CollectionUsersCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            avaImageView.topAnchor.constraint(equalTo: topAnchor, constant: 17),
            avaImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: avaImageView.bottomAnchor, constant: 4),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            
            someTextLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant:6),
            someTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
            someTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            
            writeButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            writeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -17)
        ])
    }
}
