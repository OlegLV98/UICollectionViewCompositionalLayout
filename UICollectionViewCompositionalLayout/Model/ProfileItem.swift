//
//  ProfileItem.swift
//  HW10UIKit_LesnoyOleg
//
//  Created by Oleg Lesnoy on 10.05.2024.
//

import Foundation

struct ProfileItem: Identifiable {
    let id: String = UUID().uuidString
    var ava: String
    var name: String
    var nickName: String
    var profileData: [ProfileTableItem]
    
    static func mockData() -> ProfileItem {
        ProfileItem(ava: "Jane",
                    name: "Amanda Jane",
                    nickName: "amandajane",
                    profileData: [
                        ProfileTableItem(info: "Username", data: "Amanda Jane"),
                        ProfileTableItem(info: "Email", data: "amanda@gmail.com"),
                        ProfileTableItem(info: "Phone", data: "+ 65 2311 333"),
                        ProfileTableItem(info: "Date of birth", data: "20/05/1990"),
                        ProfileTableItem(info: "Address", data: "123 Royal Street, New York")
                    ])
    }
}
