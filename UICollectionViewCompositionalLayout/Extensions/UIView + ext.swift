//
//  UIView + ext.swift
//  HW10UIKit_LesnoyOleg
//
//  Created by Oleg Lesnoy on 01.05.2024.
//

import UIKit

extension UIView {
    static func config<T: UIView>(view: T, completion: @escaping (T) -> Void) -> T {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        completion(view)
        return view
    }
}
