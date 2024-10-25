//
//  ProfileTableCell.swift
//  HW10UIKit_LesnoyOleg
//
//  Created by Oleg Lesnoy on 09.05.2024.
//

import UIKit

final class ProfileTableCell: UITableViewCell {
    private lazy var infoLabel = AppUI.createLabel(font: .systemFont(ofSize: 16, weight: .medium),
                                                      textColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
    
    private lazy var dataLabel = AppUI.createLabel(font: .systemFont(ofSize: 16, weight: .medium))
    private lazy var hStack = AppUI.createHStack(from: [infoLabel, dataLabel])
    
    private lazy var separatorView: UIView = {
        .config(view: $0) { view in
            view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        }
    }(UIView())
    
    func setupCell(info: String, data: String) {
        backgroundColor = .clear
        selectionStyle = .none
        infoLabel.text = info
        dataLabel.text = data
        
        addSubview(hStack)
        addSubview(separatorView)
        setConstraints()
    }
}

extension ProfileTableCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            hStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            hStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            hStack.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            
            separatorView.topAnchor.constraint(equalTo: hStack.bottomAnchor, constant: 15),
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2)
            
        ])
    }
}
