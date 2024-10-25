//
//  MsgTableItem.swift
//  HW10UIKit_LesnoyOleg
//
//  Created by Oleg Lesnoy on 01.05.2024.
//

import Foundation

struct MsgTableItem: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var text: String
    var image: String
    
    static func mockData() -> [MsgTableItem] {
        [
            MsgTableItem(name: "Sarah",
                         text: "Hey Jane! Just wanted to share my excitement about the upcoming iOS Collection Layout Workshop. Can't wait to dive deep into designing some awesome layouts together!",
                         image: "Sarah"),
            MsgTableItem(name: "Alex",
                         text: "Hi Jane! I'm hosting an interactive demo session next week where we'll explore the latest trends in iOS collection layouts. Come join us for some hands-on experimentation and creative brainstorming!",
                         image: "Alex"),
            MsgTableItem(name: "David",
                         text: "I'm really looking forward to the panel discussion on the future of collection layouts in iOS. It's going to be fascinating to hear insights from industry experts and discuss where the field is heading.",
                         image: "David"),
            MsgTableItem(name: "Emily",
                         text: "Hi Jane! Who's up for a challenge? Our hackathon event is happening next month, and I'm rallying a team to build the ultimate collection layout. Let's make something amazing together!",
                         image: "Emily"),
            MsgTableItem(name: "Michael",
                         text: "Excited to present at the case study showcase next week! I'll be sharing some insights from our recent project, discussing the design decisions behind our collection layout, and sharing key learnings. Hope to see you there!",
                         image: "Michael"),
            MsgTableItem(name: "Lisa",
                         text: "Just a reminder about the networking mixer happening this Friday. It's a great opportunity to meet fellow iOS developers, share experiences, and expand your professional network. See you there!",
                         image: "Lisa"),
        ]
    }
}
