//
//  PrettyTabItemView.swift
//  PrettyTabBar
//
//  Created by Nikolay Zhaboedov on 13.11.2022.
//

import SwiftUI

struct PrettyTabItemView: View {
    private var tabBarItem: TabBarItem
    private var isSelected: Bool
    
    init(tabBarItem: TabBarItem, isSelected: Bool) {
        self.tabBarItem = tabBarItem
        self.isSelected = isSelected
    }
    
    var body: some View {
        HStack {
            if isSelected {
                icon()
                Text(tabBarItem.title)
                    .lineLimit(1)
            } else {
                icon()
            }
        }
        .foregroundColor(isSelected ? Color.black : Color.black.opacity(0.7))
        .padding(13)
        .frame(
            minWidth: 35,
            minHeight: 35
        )
        .cornerRadius(10)
    }
}

private extension PrettyTabItemView {
    private func deselectedBody() -> some View {
        icon()
    }
    
    private func icon() -> some View {
        Image(systemName: tabBarItem.iconSystemName)
            .frame(width: 22, height: 22)
    }
}
