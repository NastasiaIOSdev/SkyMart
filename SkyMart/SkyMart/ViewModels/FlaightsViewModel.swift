//
//  FlaightsViewModel.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 03.06.2024.
//

import SwiftUI
import Combine

final class FlaightsViewModel: ObservableObject {
    @Published var flightOffers: [Offer] = []
    private var cancellables: Set<AnyCancellable> = []
    
    func fetchFlightsOffers() {
        NetworkManager.shared.fetchOffers()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] offers in
                self?.flightOffers = offers
            })
            .store(in: &cancellables)
    }
}
