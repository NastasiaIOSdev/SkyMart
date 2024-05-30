//
//  AppColors.swift
//  FlightSearch
//
//  Created by Анастасия Ларина on 29.05.2024.
//

import SwiftUI

enum AppColors {
    static let grey1 = Color(hex: 0x1D1E20)
    static let grey2 = Color(hex: 0x242529)
    static let grey3 = Color(hex: 0x2F3035)
    static let grey4 = Color(hex: 0x3E3F43)
    static let grey5 = Color(hex: 0x5E5F61)
    static let grey6 = Color(hex: 0x9F9F9F)
    static let grey7 = Color(hex: 0xDBDBDB)
    static let black = Color(hex: 0x0C0C0C)
    static let white = Color(hex: 0xFFFFFF)
    static let blue = Color(hex: 0x2261BC)
    static let darkBlue = Color(hex: 0x00427D)
    static let green = Color(hex: 0x3A633B)
    static let darkGreen = Color(hex: 0x1E341F)
    static let red = Color(hex: 0xFF5E5E)
    static let orange = Color(hex: 0xF36E36)
}

extension Color {
    init(hex: UInt64) {
        self.init(
            red: Double((hex & 0xFF0000) >> 16) / 255.0,
            green: Double((hex & 0x00FF00) >> 8) / 255.0,
            blue: Double(hex & 0x0000FF) / 255.0
        )
    }
}
