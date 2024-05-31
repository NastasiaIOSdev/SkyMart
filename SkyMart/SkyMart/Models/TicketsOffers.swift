//
//  TicketsOffers.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 30.05.2024.
//

import Foundation

// MARK: - Welcome
struct Welcome3: Codable {
    let ticketsOffers: [TicketsOffer]

    enum CodingKeys: String, CodingKey {
        case ticketsOffers = "tickets_offers"
    }
}

// MARK: - TicketsOffer
struct TicketsOffer: Codable {
    let id: Int
    let title: String
    let timeRange: [String]
    let price: Price3

    enum CodingKeys: String, CodingKey {
        case id, title
        case timeRange = "time_range"
        case price
    }
}

// MARK: - Price
struct Price3: Codable {
    let value: Int
}
