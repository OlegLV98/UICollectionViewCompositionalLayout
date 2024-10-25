//
//  NewsHeaderCell.swift
//  HW10UIKit_LesnoyOleg
//
//  Created by Oleg Lesnoy on 07.05.2024.
//

import UIKit

protocol SelfConfiguringSupplementaryView {
    static var reuseId: String { get }
    func setConstraints()
    func setupView(header: String?, footer: String?, viewButton: String?)
}

final class NewsHeaderCell: UICollectionReusableView, SelfConfiguringSupplementaryView {
    static let reuseId = "NewsHeaderCell"
    
    private lazy var headerTitleLabel = AppUI.createLabel(font: .systemFont(ofSize: 20, weight: .heavy))
    
    private lazy var button: UIButton = {
        .config(view: $0) { view in
            view.contentMode = .scaleAspectFit
            view.clipsToBounds = true
            view.widthAnchor.constraint(equalToConstant: 21).isActive = true
            view.heightAnchor.constraint(equalToConstant: 21).isActive = true
        }
    }(UIButton())
    private lazy var hStack = AppUI.createHStack(from: [headerTitleLabel, button])
    
    func setupView(header: String?, footer: String?, viewButton: String?) {
        addSubview(hStack)
        headerTitleLabel.text = header
        button.setImage(UIImage(named: viewButton ?? ""), for: .normal)
        
        setConstraints()
    }
}

extension NewsHeaderCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: topAnchor),
            hStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 13),
            hStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -38),
            hStack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
