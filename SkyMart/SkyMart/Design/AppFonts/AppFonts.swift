//
//  AppFonts.swift
//  FlightSearch
//
//  Created by Анастасия Ларина on 29.05.2024.
//

import SwiftUI

enum AppFonts {
    case regular14
    case regular16
    case medium16
    case semibold14
    case semibold16
    case semibold20
    case semibold22
    
    var font: Font {
        switch self {
            
        case .regular14:
            return .custom("SF-Pro-Display-Regular", size: 14)
        case .regular16:
            return .custom("SF-Pro-Display-Regular", size: 16)
        case .medium16:
            return .custom("SF-Pro-Display-Medium", size: 16)
        case .semibold14:
            return .custom("SF-Pro-Display-Semibold", size: 14)
        case .semibold20:
            return .custom("SF-Pro-Display-Semibold", size: 20)
        case .semibold22:
            return .custom("SF-Pro-Display-Semibold", size: 22)
        case .semibold16:
            return .custom("SF-Pro-Display-Semibold", size: 16)
        }
    }
}
