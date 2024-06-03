//
//  TicketsViewModel.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 03.06.2024.
//

import SwiftUI
import Combine

final class TicketsViewModel: ObservableObject {
    @Published var ticketsOffers: [TicketsOffer] = []
    private var cancellables: Set<AnyCancellable> = []
    
    func fetchTicketsOffers() {
        NetworkManager.shared.fetchTickets()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] tickets in
                self?.ticketsOffers = tickets
            })
            .store(in: &cancellables)
    }
}
