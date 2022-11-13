//
//  PrettyTabBarItemPreferenceKey.swift
//  PrettyTabBar
//
//  Created by Nikolay Zhaboedov on 13.11.2022.
//

import SwiftUI

struct PrettyTabBarItemPreferenceKey: PreferenceKey {
    static var defaultValue: [TabBarItem] = []
    
    static func reduce(
        value: inout [TabBarItem],
        nextValue: () -> [TabBarItem]
    ) {
        value += nextValue()
    }
}
