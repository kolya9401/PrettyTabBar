//
//  PrettyTabView.swift
//  PrettyTabBar
//
//  Created by Nikolay Zhaboedov on 13.11.2022.
//

import SwiftUI

public struct PrettyTabView<Content: View>: View {
    private let content: Content
    @Binding
    private var selection: TabBarItem
    
    @State
    private var tabBarItems: [TabBarItem] = []
    
    public init(
        selection: Binding<TabBarItem>,
        @ViewBuilder content: () -> Content
    ) {
        self.content = content()
        self._selection = selection
    }
    
    public var body: some View {
        ZStack(alignment: .bottom) {
            content
        }
        .safeAreaInset(edge: .bottom, content: {
            prettyTabBarView()
        })
        .onPreferenceChange(PrettyTabBarItemPreferenceKey.self) { value in
            self.tabBarItems = value
        }
    }
}

private extension PrettyTabView {
    func prettyTabBarView() -> some View {
        HStack {
            if UIDevice.current.userInterfaceIdiom == .pad {
                // TODO: Fix Ipad 
                Spacer(minLength: 53)
                PrettyTabBarView(
                    tabBarItems: tabBarItems,
                    selection: $selection
                )
                Spacer(minLength: 53)
            } else {
                Spacer(minLength: 53)
                PrettyTabBarView(
                    tabBarItems: tabBarItems,
                    selection: $selection
                )
                Spacer(minLength: 53)
            }
        }
    }
}
