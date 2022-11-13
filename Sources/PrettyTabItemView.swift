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
                Spacer()
                icon()
                Text(tabBarItem.title)
                    .lineLimit(1)
                Spacer()
            } else {
                icon()
            }
        }
        .foregroundColor(
            isSelected ? Color.black : Color.black.opacity(0.7)
        )
        .padding([.top, .bottom], 13)
        .cornerRadius(10)
        .frame(minWidth: 44, minHeight: 44)
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
