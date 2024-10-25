//
//  CollectionNewsCell.swift
//  HW10UIKit_LesnoyOleg
//
//  Created by Oleg Lesnoy on 03.05.2024.
//

import UIKit
protocol SelfConfiguringCell {
    static var reuseId: String { get }
    func setupCell(item: CollectionItem)
    func setConstraints()
}

final class CollectionNewsCell: UICollectionViewCell, SelfConfiguringCell {
    static let reuseId: String = "CollectionNewsCell"
    
    private lazy var bgImageView: UIImageView = {
        .config(view: $0) { view in
            view.contentMode = .scaleAspectFill
            view.clipsToBounds = true
        }
    }(UIImageView())
    
    private lazy var titleLabel = AppUI.createLabel(font: .systemFont(ofSize: 20, weight: .heavy),
                                                      textColor: .white)
    
    private lazy var dateLabel = AppUI.createLabel(font: .systemFont(ofSize: 12, weight: .light),
                                                      textColor: #colorLiteral(red: 0.8077269197, green: 0.8077268004, blue: 0.80772686, alpha: 1))
    
    private lazy var someTextLabel = AppUI.createLabel(font: .systemFont(ofSize: 14, weight: .light),
                                                       textColor: .white, numberOfLines: 2)
    
    private lazy var readButton: UIButton = {
        .config(view: $0) { view in
            view.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
            view.titleLabel?.textColor = .white
            view.contentHorizontalAlignment = .leading
        }
    }(UIButton())
    
    func setupCell(item: CollectionItem) {
        layer.cornerRadius = 20
        clipsToBounds = true
        addSubview(bgImageView)
        addSubview(titleLabel)
        addSubview(dateLabel)
        addSubview(someTextLabel)
        addSubview(readButton)
        bgImageView.image = UIImage(named: item.image ?? "")
        titleLabel.text = item.title
        dateLabel.text = item.date
        someTextLabel.text = item.text
        readButton.setTitle("\(item.buttonTitle ?? "")", for: .normal)
        setConstraints()
    }
}

extension CollectionNewsCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            bgImageView.topAnchor.constraint(equalTo: topAnchor),
            bgImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bgImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bgImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 23),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
            dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 45),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
            someTextLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 9),
            someTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            someTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
            readButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -22),
            readButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            readButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25)
        ])
    }
}
