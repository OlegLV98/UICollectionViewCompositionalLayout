//
//  MsgTableCell.swift
//  HW10UIKit_LesnoyOleg
//
//  Created by Oleg Lesnoy on 01.05.2024.
//

import UIKit

final class MsgTableCell: UITableViewCell {
    private lazy var cellView: UIView = {
        .config(view: $0) { _ in }
    }(UIView())
    
    private lazy var avaImageView: UIImageView = {
        .config(view: $0) { view in
            view.contentMode = .scaleAspectFill
            view.clipsToBounds = true
            view.widthAnchor.constraint(equalToConstant: 56).isActive = true
            view.heightAnchor.constraint(equalToConstant: 56).isActive = true
            view.layer.cornerRadius = 28
        }
    }(UIImageView())
    private lazy var nameLabel = AppUI.createLabel(font: .systemFont(ofSize: 16, weight: .light))

    private lazy var messageLabel = AppUI.createLabel(font: .systemFont(ofSize: 12, weight: .light), numberOfLines: 2)
    
    private lazy var separatorView: UIView = {
        .config(view: $0) { view in
            view.heightAnchor.constraint(equalToConstant: 1).isActive = true
            view.backgroundColor = #colorLiteral(red: 0.882971704, green: 0.8829715848, blue: 0.882971704, alpha: 1)
        }
    }(UIView())
    
    func setupCell(item: MsgTableItem) {
        selectionStyle = .none
        addSubview(cellView)
        cellView.addSubview(avaImageView)
        cellView.addSubview(nameLabel)
        cellView.addSubview(messageLabel)
        cellView.addSubview(separatorView)
        
        avaImageView.image = UIImage(named: item.image)
        nameLabel.text = item.name
        messageLabel.text = item.text
        setConstraints()
    }
}

extension MsgTableCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: topAnchor),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            avaImageView.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 14),
            avaImageView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 16),
            avaImageView.bottomAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: -16),
            
            nameLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 23),
            nameLabel.leadingAnchor.constraint(equalTo: avaImageView.trailingAnchor, constant: 9),
            nameLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -9),
            
            messageLabel.bottomAnchor.constraint(equalTo: separatorView.topAnchor, constant: -14),
            messageLabel.leadingAnchor.constraint(equalTo: avaImageView.trailingAnchor, constant: 9),
            messageLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -9),
            
            separatorView.topAnchor.constraint(equalTo: messageLabel.bottomAnchor),
            separatorView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 16),
            separatorView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -16),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1),
        ])
    }
}
