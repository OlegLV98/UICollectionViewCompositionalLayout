//
//  CollectionSection.swift
//  HW10UIKit_LesnoyOleg
//
//  Created by Oleg Lesnoy on 03.05.2024.
//

import Foundation

struct CollectionSection {
    var header: String
    var footer: String? = nil
    var viewButton: String
    var items: [CollectionItem]
    
    static func mockData() -> [CollectionSection] {
        let newsSection = CollectionSection(header: "News",
                                           footer: "Stay tuned for more updates on the latest advancements in AI technology, shaping the future of industries worldwide.",
                                            viewButton: "news",
                                           items: [
                                            CollectionItem(date: "20 april 24",
                                                           image: "QuantumComputing",
                                                           title: "Quantum Computing",
                                                           text: "Breakthrough in Quantum Computing: Researchers have made significant strides in developing practical applications for quantum computing, promising unparalleled computational power. This breakthrough opens doors to solving complex problems in areas like cryptography, drug discovery, and optimization, revolutionizing industries and pushing the boundaries of what's possible in IT.",
                                                           buttonTitle: "Read"),
                                            CollectionItem(date: "20 april 24",
                                                           image: "AIPower",
                                                           title: "AI Power",
                                                           text: "Advancements in Artificial Intelligence: AI continues to improve at an astonishing rate, with breakthroughs in natural language processing, computer vision, and reinforcement learning. These advancements are leading to more personalized user experiences, enhanced automation in various sectors, and breakthroughs in healthcare, finance, and environmental monitoring, ultimately improving efficiency and quality of life.",
                                                           buttonTitle: "Read")
        ])
        
        let eventsSection = CollectionSection(header: "Events", viewButton: "More", items: [
            CollectionItem(image: "sequrity", text: "App Launch Party"),
            CollectionItem(image: "arrow", text: "User Feedback Forum"),
            CollectionItem(image: "mail", text: "Tech Talk: Behind the Scenes of App Development"),
            
            CollectionItem(image: "heart", text: "App Workshop: Mastering Key Features"),
            CollectionItem(image: "cancel", text: "Community Challenge: App Hackathon"),
            CollectionItem(image: "mobile", text: "App Anniversary Celebration")
        ])
        
        let usersSection = CollectionSection(header: "Users", viewButton: "Show all", items: [
            CollectionItem(ava: "EmmaCarter", text: "Software Engineer", name: "Emma Carter", buttonTitle: "Write"),
            CollectionItem(ava: "MarcusRodriguez", text: "High School Teacher", name: "Marcus Rodriguez", buttonTitle: "Write"),
            CollectionItem(ava: "SophieChang", text: "Graphic Designer", name: "Sophie Chang", buttonTitle: "Write")
        ])
        
        return [newsSection, eventsSection, usersSection]
    }
}
