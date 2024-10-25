//
//  CollectionEventsCell.swift
//  HW10UIKit_LesnoyOleg
//
//  Created by Oleg Lesnoy on 03.05.2024.
//

import UIKit

final class CollectionEventsCell: UICollectionViewCell, SelfConfiguringCell{
    static let reuseId: String = "CollectionEventsCell"
    
    private lazy var smallImageView: UIImageView = {
        .config(view: $0) { view in
            view.contentMode = .scaleAspectFit
            view.widthAnchor.constraint(equalToConstant: 25).isActive = true
            view.heightAnchor.constraint(equalToConstant: 25).isActive = true
            view.clipsToBounds = true
        }
    }(UIImageView())
    
    private lazy var someTextLabel = AppUI.createLabel(font: .systemFont(ofSize: 14, weight: .medium))
    
    private lazy var forwardButton: UIButton = {
        .config(view: $0) { view in
            view.setImage(UIImage(systemName: "chevron.forward"), for: .normal)
            view.tintColor = .black
            view.clipsToBounds = true
            view.contentMode = .scaleAspectFit
            view.widthAnchor.constraint(equalToConstant: 16).isActive = true
            view.heightAnchor.constraint(equalToConstant: 16).isActive = true
        }
    }(UIButton())
    func setupCell(item: CollectionItem) {
        backgroundColor = .white
        layer.cornerRadius = 10
        clipsToBounds = true
        addSubview(smallImageView)
        addSubview(someTextLabel)
        addSubview(forwardButton)
        smallImageView.image = UIImage(named: "\(item.image ?? "")")
        someTextLabel.text = item.text
        setConstraints()
    }
}

extension CollectionEventsCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            smallImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            smallImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            
            someTextLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            someTextLabel.leadingAnchor.constraint(equalTo: smallImageView.trailingAnchor, constant: 10),
            someTextLabel.trailingAnchor.constraint(equalTo: forwardButton.leadingAnchor, constant: -10),
            
            forwardButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            forwardButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18)
        ])
    }
}
