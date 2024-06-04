//
//  ContentView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 30.05.2024.
//

import SwiftUI

struct ContentView: View {
@StateObject var coordinator = AppCoordinator()
    
    var body: some View {
        TabView(selection: $coordinator.selectedTab) {
            FlightsView(coordinator: coordinator)
                .tabItem {
                    Image("airplane")
                    Text("Авиабилеты")
                }
                .tag(AppCoordinator.Tab.flights)
            HotelsView()
                .tabItem {
                    Image("hotel")
                    Text("Отели")
                }
                .tag(AppCoordinator.Tab.hotels)
            InShortView()
                .tabItem {
                    Image("location")
                    Text("Короче")
                }
                .tag(AppCoordinator.Tab.locations)
            SubscriptionsView()
                .tabItem {
                    Image("bell")
                    Text("Подписки")
                }
                .tag(AppCoordinator.Tab.subscriptions)
            ProfileView()
                .tabItem {
                    Image("account")
                    Text("Профиль")
                }
                .tag(AppCoordinator.Tab.account)
        }
        .accentColor(AppColors.blue)
        .sheet(isPresented: $coordinator.isShowingChoosenFlightView) {
            ChoosenFlightView(cityDeparture: $coordinator.cityDeparture, cityArrival: $coordinator.cityArrival)
        }
    }
}
