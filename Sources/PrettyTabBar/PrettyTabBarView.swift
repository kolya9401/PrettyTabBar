//
//  PrettyTabBarView.swift
//  PrettyTabBar
//
//  Created by Nikolay Zhaboedov on 13.11.2022.
//

import SwiftUI

struct PrettyTabBarView: View {
    let tabBarItems: [TabBarItem]

    @Binding
    var selection: TabBarItem
    
    @Namespace
    private var namespace
    
    var body: some View {
        HStack {
            ForEach(tabBarItems, id: \.self) { item in
                PrettyTabItemView(tabBarItem: item, isSelected: selection == item)
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
                        withAnimation(.linear) {
                            self.selection = item
                        }
                    }
            }
        }
        .padding(8)
        .background(ignoresSafeAreaEdges: .bottom)
        .cornerRadius(13)
        .shadow(color: .gray.opacity(0.3), radius: 13, x: 0, y: 5)
    }
}

struct PrettyTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            PrettyTabBarView(
                tabBarItems: [.home, .favorites, .person],
                selection: .constant(.favorites)
            )
        }
    }
}
