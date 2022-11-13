//
//  TabBarItem.swift
//  PrettyTabBar
//
//  Created by Nikolay Zhaboedov on 13.11.2022.
//

public struct TabBarItem: Hashable {
    let title: String
    let iconSystemName: String
    
    public init(
        title: String,
        iconSystemName: String
    ) {
        self.title = title
        self.iconSystemName = iconSystemName
    }
}
