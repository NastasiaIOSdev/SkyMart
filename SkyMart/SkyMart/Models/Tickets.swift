//
//  Tickets.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 30.05.2024.
//

import Foundation

//// MARK: - Welcome
//struct Welcome2: Decodable {
//    let tickets: [Tickets]
//}
//
//// MARK: - Ticket
//struct Tickets: Decodable {
//    let id: Int
//    let badge: String?
//    let price: Price
//    let providerName, company: String
//    let departure, arrival: Arrival
//    let hasTransfer, hasVisaTransfer: Bool
//    let luggage: Luggage
//    let handLuggage: HandLuggage
//    let isReturnable, isExchangable: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case id, badge, price
//        case providerName = "provider_name"
//        case company, departure, arrival
//        case hasTransfer = "has_transfer"
//        case hasVisaTransfer = "has_visa_transfer"
//        case luggage
//        case handLuggage = "hand_luggage"
//        case isReturnable = "is_returnable"
//        case isExchangable = "is_exchangable"
//    }
//}
//
//// MARK: - Arrival
//struct Arrival: Decodable {
//    let town: Town
//    let date: String
//    let airport: Airport
//}
//
//enum Airport: String, Decodable {
//    case aer = "AER"
//    case vko = "VKO"
//}
//
//enum Town: String, Decodable {
//    case москва = "Москва"
//    case сочи = "Сочи"
//}
//
//// MARK: - HandLuggage
//struct HandLuggage: Decodable {
//    let hasHandLuggage: Bool
//    let size: String?
//
//    enum CodingKeys: String, CodingKey {
//        case hasHandLuggage = "has_hand_luggage"
//        case size
//    }
//}
//
//// MARK: - Luggage
//struct Luggage: Decodable {
//    let hasLuggage: Bool
//   // let price: Price?
//
//    enum CodingKeys: String, CodingKey {
//        case hasLuggage = "has_luggage"
//        case price
//    }
//}

//// MARK: - Price
//struct Price: Decodable {
//    let value: Int
//}
