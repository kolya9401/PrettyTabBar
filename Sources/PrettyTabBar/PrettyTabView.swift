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
                Spacer()
                PrettyTabBarView(tabBarItems: tabBarItems, selection: $selection)
            } else {
                PrettyTabBarView(tabBarItems: tabBarItems, selection: $selection)
            }
        }
        .padding()
    }
}

struct PrettyTabView_Previews: PreviewProvider {
    static var previews: some View {
        PrettyTabView(selection: .constant(.home)) {
            Color.red
                .prettyTabBarItem(.favorites, selection: .constant(.favorites))
            
            Color.green
                .prettyTabBarItem(.person, selection: .constant(.person))
        }
    }
}
