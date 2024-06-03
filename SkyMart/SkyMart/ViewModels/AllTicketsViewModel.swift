//
//  AllTicketsViewModel.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 03.06.2024.
//

import SwiftUI
import Combine

final class AllTicketsViewModel: ObservableObject {
    @Published var allTicketsOffers: [Ticket] = []
    private var cancellables: Set<AnyCancellable> = []
    
    func fetchAllFlaightsOffers() {
        NetworkManager.shared.fetchAllTickets()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error: \(error)")
                case .finished:
                    print("Закончилась загрузка билетов")
                }
            },
                  receiveValue: { [weak self] tickets in
                self?.allTicketsOffers = tickets
            })
            .store(in: &cancellables)
    }
}
