//
//  TicketsOffers.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 30.05.2024.
//
//
import Foundation
//
// MARK: - Welcome
struct TicketsResponse: Codable {
    let ticketsOffers: [TicketsOffer]
    
    enum CodingKeys: String, CodingKey {
        case ticketsOffers = "tickets_offers"
    }
}

// MARK: - TicketsOffer
struct TicketsOffer: Codable, Identifiable {
    let id: Int
    let title: String
    let time: [String]
    let price: Price2
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case time = "time_range"
        case price
    }
}
// MARK: - Price
struct Price2: Codable {
    let value: Int
}
