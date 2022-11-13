//
//  ExampleView.swift
//  Example
//
//  Created by Nikolay Zhaboedov on 13.11.2022.
//

import SwiftUI
import PrettyTabBar

struct ExampleView: View {
    @State var selectionTabBarItem: TabBarItem = .favorites
      
      var body: some View {
          PrettyTabView(selection: $selectionTabBarItem) {
              TestView(name: "Home", color: .red)
                  .prettyTabBarItem(.home, selection: $selectionTabBarItem)
              
              TestListView()
                  .prettyTabBarItem(.person, selection: $selectionTabBarItem)
              
              TestView(name: "Favorites", color: .green)
                  .prettyTabBarItem(.favorites, selection: $selectionTabBarItem)
          }
      }
}

struct TestView: View {
    let name: String
    let color: Color
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                Button(name) {
                    print(name)
                }
                Spacer()
                Button("Нижняя кнопка") {
                    print("Нижняя кнопка")
                }
            }
            Spacer()
        }
        
        .background(color)
    }
}

struct TestListView: View {
    private struct Item: Hashable {
        let id: UUID = .init()
        let title: String
    }
    
    private let items: [Item] = {
        return Array<String>(repeating: "Hello World!", count: 100)
            .map { .init(title: $0) }
    }()
    
    var body: some View {
        ScrollView{
            VStack {
                ForEach(items, id: \.self) { item in
                    HStack {
                        Text(item.title)
                            .padding()
                        Spacer()
                    }
                    
                }
            }
        }
        .background(Color.orange)
    }
}
