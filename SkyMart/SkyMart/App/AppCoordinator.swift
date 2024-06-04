//
//  AppCoordinator.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 30.05.2024.
//

import SwiftUI
import Combine

class AppCoordinator: ObservableObject {
    enum Tab {
        case flights, hotels, locations, subscriptions, account
    }
    @Published var selectedTab: Tab = .flights
    @Published var cityDeparture: String = UserDefaults.standard.string(forKey: "lastCityDeparture") ?? ""
    @Published var cityArrival: String = UserDefaults.standard.string(forKey: "lastCityArrival") ?? ""
    @Published var isShowingChoosenFlightView = false
}
