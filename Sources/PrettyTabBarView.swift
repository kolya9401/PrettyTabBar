//
//  PrettyTabBarView.swift
//  PrettyTabBar
//
//  Created by Nikolay Zhaboedov on 13.11.2022.
//

import SwiftUI

struct PrettyTabBarView: View {
    private let tabBarItems: [TabBarItem]

    @Binding
    private var selection: TabBarItem
    
    @State
    private var animateSelection: TabBarItem
    
    init(
        tabBarItems: [TabBarItem],
        selection: Binding<TabBarItem>
    ) {
        self.tabBarItems = tabBarItems
        self._selection = selection
        self.animateSelection = selection.wrappedValue
    }
    
    @Namespace
    private var namespace
    
    var body: some View {
        HStack {
            ForEach(tabBarItems, id: \.self) { item in
                PrettyTabItemView(
                    tabBarItem: item,
                    isSelected: animateSelection == item
                )
                .background(
                    ZStack {
                        if selection == item {
                            RoundedRectangle(cornerRadius: 13)
                                .fill(Color.gray.opacity(0.2))
                                .matchedGeometryEffect(
                                    id: "selection_background",
                                    in: namespace
                                )
                        }
                    }
                )
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selection = item
                    }
                }
            }
        }
        .padding(8)
        .background(ignoresSafeAreaEdges: .bottom)
        .cornerRadius(13)
        .shadow(color: .gray.opacity(0.3), radius: 13, x: 0, y: 5)
        .onChange(of: selection) { newValue in
            withAnimation(.easeInOut) {
                animateSelection = newValue
            }
        }
    }
}
