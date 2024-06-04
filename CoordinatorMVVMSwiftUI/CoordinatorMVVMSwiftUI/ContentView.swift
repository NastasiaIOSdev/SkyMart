//
//  ContentView.swift
//  CoordinatorMVVMSwiftUI
//
//  Created by Анастасия Ларина on 04.06.2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var coordinator = AppCoordinator()
    
    var body: some View {
        NavigationStack {
            TabView(selection: $coordinator.selectedTab) {
                FirstTabView(coordinator: coordinator)
                    .tabItem {
                        Text("First")
                    }
                    .tag(AppCoordinator.Tab.first)
                
                SecondTabView()
                    .tabItem {
                        Text("Second")
                    }
                    .tag(AppCoordinator.Tab.second)
                
                LastTabView()
                    .tabItem {
                        Text("Third")
                    }
                    .tag(AppCoordinator.Tab.third)
            }
            .onAppear {
                if coordinator.isShowingThirdSearchView {
                    print("isShowingThirdSearchView became true")
                    coordinator.isShowingThirdSearchView = false
                    coordinator.selectedTab = .third
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
