//
//  PriceFormatter.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 01.06.2024.
//

import Foundation

struct PriceFormatter {
    static let shared = PriceFormatter()
    private let priceFormatter: NumberFormatter
    private init() {
        priceFormatter = NumberFormatter()
        priceFormatter.numberStyle = .decimal
        priceFormatter.groupingSeparator = " "
    }
    func string(from number: Int) -> String {
        return priceFormatter.string(from: NSNumber(value: number)) ?? ""
    }
}
