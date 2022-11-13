//
//  View+PrettyTabBarItem.swift
//  PrettyTabBar
//
//  Created by Nikolay Zhaboedov on 13.11.2022.
//

import SwiftUI

public extension View {
    func prettyTabBarItem(_ tabBarItem: TabBarItem, selection: Binding<TabBarItem>) -> some View {
        self
            .modifier(
                PrettyTabBarItemViewModifier(
                    tabBarItem: tabBarItem,
                    selection: selection
                )
            )
    }
}
