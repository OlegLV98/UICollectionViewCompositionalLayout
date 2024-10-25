//
//  UsersHeaderCell.swift
//  HW10UIKit_LesnoyOleg
//
//  Created by Oleg Lesnoy on 07.05.2024.
//

import UIKit

final class UsersHeaderCell: UICollectionReusableView, SelfConfiguringSupplementaryView {
    static let reuseId = "UsersHeaderCell"
    
    private lazy var headerTitleLabel = AppUI.createLabel(font: .systemFont(ofSize: 20, weight: .heavy))
    
    private lazy var button: UIButton = {
        .config(view: $0) { view in
            view.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
            view.setTitleColor(#colorLiteral(red: 0, green: 0.568627451, blue: 1, alpha: 1), for: .normal)
        }
    }(UIButton())
    
    private lazy var hStack = AppUI.createHStack(from: [headerTitleLabel, button])
    
    func setupView(header: String?, footer: String?, viewButton: String?) {
        addSubview(hStack)
        headerTitleLabel.text = header
        button.setTitle(viewButton, for: .normal)
        
        setConstraints()
    }
}

extension UsersHeaderCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: topAnchor),
            hStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 13),
            hStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -33),
            hStack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
