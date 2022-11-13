//
//  PrettyTabBarItem+Items.swift
//  PrettyTabBar
//
//  Created by Nikolay Zhaboedov on 13.11.2022.
//

import PrettyTabBar

extension TabBarItem {
    static var home: TabBarItem {
        .init(
            title: "Home",
            iconSystemName: "house"
        )
    }
    
    static var person: TabBarItem {
        .init(
            title: "Person",
            iconSystemName: "person.crop.rectangle"
        )
    }
    
    static var favorites: TabBarItem {
        .init(
            title: "favorites",
            iconSystemName: "star.fill"
        )
    }
}
