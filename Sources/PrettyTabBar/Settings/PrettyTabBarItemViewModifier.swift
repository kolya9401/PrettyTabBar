//
//  PrettyTabBarItemViewModifier.swift
//  PrettyTabBar
//
//  Created by Nikolay Zhaboedov on 13.11.2022.
//

import SwiftUI

struct PrettyTabBarItemViewModifier: ViewModifier {
    private let tabBarItem: TabBarItem
    
    @Binding
    private var selection: TabBarItem
    
    init(tabBarItem: TabBarItem, selection: Binding<TabBarItem>) {
        self.tabBarItem = tabBarItem
        self._selection = selection
    }
    
    func body(content: Content) -> some View {
        content
            .opacity(selection == tabBarItem ? 1.0 : 0.0)
            .preference(key: PrettyTabBarItemPreferenceKey.self, value: [tabBarItem])
    }
}
