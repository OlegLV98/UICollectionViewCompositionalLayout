//
//  NewsFooterCell.swift
//  HW10UIKit_LesnoyOleg
//
//  Created by Oleg Lesnoy on 07.05.2024.
//

import UIKit

final class NewsFooterCell: UICollectionReusableView, SelfConfiguringSupplementaryView {
    static let reuseId = "NewsFooterCell"
    
    private lazy var footerTitleLabel = AppUI.createLabel(font: .systemFont(ofSize: 12, weight: .light),
                                                          textColor: #colorLiteral(red: 0.5960784314, green: 0.5960784314, blue: 0.5960784314, alpha: 1), numberOfLines: 3)
  
    func setupView(header: String?, footer: String?, viewButton: String?) {
        addSubview(footerTitleLabel)
        footerTitleLabel.text = footer
        setConstraints()
    }
}

extension NewsFooterCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            footerTitleLabel.topAnchor.constraint(equalTo: topAnchor),
            footerTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 13),
            footerTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -38)
        ])
    }
}
