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
}
