//
//  ProfileTableItem.swift
//  HW10UIKit_LesnoyOleg
//
//  Created by Oleg Lesnoy on 09.05.2024.
//

import Foundation

struct ProfileTableItem: Identifiable {
    let id: String = UUID().uuidString
    let info: String
    var data: String
}
