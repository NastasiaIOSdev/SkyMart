//
//  Offers.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 30.05.2024.
//

import Foundation

// MARK: - Welcome
struct OffersResponse: Codable {
    let offers: [Offer]
}

// MARK: - Offer
struct Offer: Codable, Identifiable {
    let id: Int
    let name: String
    let city: String
    let price: Price
    
    enum CodingKeys: String, CodingKey {
        case id, name = "title", city = "town", price
    }
}

// MARK: - Price
struct Price: Codable {
    let value: Int
}
