//
//  AppUI.swift
//  HW10UIKit_LesnoyOleg
//
//  Created by Oleg Lesnoy on 10.05.2024.
//

import UIKit

class AppUI {
    static func createLabel(text: String = "", font: UIFont, textColor: UIColor = .black, numberOfLines: Int = 1, textAlignment: NSTextAlignment = .left) -> UILabel {
        .config(view: UILabel()) { view in
            view.text = text
            view.numberOfLines = numberOfLines
            view.textAlignment = textAlignment
            view.font = font
            view.textColor = textColor
        }
    }
    
    static func createHStack<T: UIView>(from views: [T]) -> UIStackView {
        let stack = UIStackView()
        views.forEach {stack.addArrangedSubview($0)}
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
}
