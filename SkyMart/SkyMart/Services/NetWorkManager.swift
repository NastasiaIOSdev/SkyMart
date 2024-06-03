//
//  NetWorkManager.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 03.06.2024.
//

import Foundation
import Combine

final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
//MARK: - Fetch offers
    
    func fetchOffers() -> AnyPublisher<[Offer], Error> {
        guard let url = URL(string: Constants.offersUrl) else {
            return Fail(error: NSError(domain: "Invalid URL", code: -1, userInfo: nil))
                .eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data}
            .decode(type: OffersResponse.self, decoder: JSONDecoder())
            .map { $0.offers}
            .eraseToAnyPublisher()
    }
    
//MARK: - Fetch tickets
    
    func fetchTickets() -> AnyPublisher<[TicketsOffer], Error> {
        guard let url = URL(string: Constants.ticketsUrl) else {
            return Fail(error: NSError(domain: "Invalid URL", code: -1, userInfo: nil))
                .eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data}
            .decode(type: TicketsResponse.self, decoder: JSONDecoder())
            .map { $0.ticketsOffers}
            .eraseToAnyPublisher()
    }
    
//MARK: - Fetch all tickets
    
    func fetchAllTickets() -> AnyPublisher<[Ticket], Error> {
        guard let url = URL(string: Constants.allTicketsUrl) else {
        return Fail(error: NSError(domain: "Invalid URL", code: -1, userInfo: nil))
                .eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data}
            .decode(type: AllTicketsResponce.self, decoder: JSONDecoder())
            .map { $0.tickets}
            .eraseToAnyPublisher()
    }
}
