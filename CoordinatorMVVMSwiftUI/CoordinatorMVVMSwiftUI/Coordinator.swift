//
//  Coordinator.swift
//  CoordinatorMVVMSwiftUI
//
//  Created by Анастасия Ларина on 04.06.2024.
//

import SwiftUI
import Combine

class AppCoordinator: ObservableObject {
    enum Tab {
        case first, second, third
    }
    
    @Published var selectedTab: Tab = .first
    @Published var isShowingModal: Bool = false
    @Published var isShowingThirdSearchView: Bool = false
    @Published var isShowingFoursSearchView: Bool = false
    @Published var isShowingFifthSearchView: Bool = false
    @Published var isClosingModal: Bool = false // Добавлено для управления закрытием модального окна
}
// Модель для хранения состояния модального представления
struct ModalView: View {
    @ObservedObject var coordinator: AppCoordinator
    
    var body: some View {
        VStack {
            Text("Модальное окно")
            Button("Город") {
                coordinator.isShowingModal = false
                coordinator.isShowingThirdSearchView = true
                print("isShowingThirdSearchView: \(coordinator.isShowingThirdSearchView)")
            }
        }
    }
}

// Каждая вкладка таббара будет иметь свой собственный View и ViewModel
struct FirstTabView: View {
    @ObservedObject var coordinator: AppCoordinator
    
    var body: some View {
        VStack {
            Text("Первый таб")
            Button("Поиск") {
                coordinator.isShowingModal = true
            }
        }
        .sheet(isPresented: $coordinator.isShowingModal) {
            ModalView(coordinator: coordinator)
        }
    }
}

struct SecondTabView: View {
    var body: some View {
        Text("Second Tab")
    }
}

struct LastTabView: View {
    var body: some View {
        Text("Third Tab")
    }
}

// Третий поиск
struct ThirdSearchView: View {
    @ObservedObject var coordinator: AppCoordinator
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Third Search View")
                Button("Return") {
                    coordinator.isShowingThirdSearchView = false
                }
                NavigationLink(destination: FoursSearchView(coordinator: coordinator),
                               isActive: $coordinator.isShowingFoursSearchView) {
                    EmptyView()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

// Четвертый поиск
struct FoursSearchView: View {
    @ObservedObject var coordinator: AppCoordinator
    
    var body: some View {
        VStack {
            Text("Fours Search View")
            Button("Return") {
                coordinator.isShowingFoursSearchView = false
            }
            Button("Next") {
                coordinator.isShowingFifthSearchView = true
            }
        }
        .fullScreenCover(isPresented: $coordinator.isShowingFifthSearchView) {
            FifthSearchView(coordinator: coordinator)
        }
    }
}

// Пятый поиск
struct FifthSearchView: View {
    @ObservedObject var coordinator: AppCoordinator
    
    var body: some View {
        VStack {
            Text("Fifth Search View")
            Button("Return") {
                coordinator.isShowingFifthSearchView = false
            }
        }
    }
}
