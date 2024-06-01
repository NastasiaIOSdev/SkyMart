//
//  DateFormatter.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 01.06.2024.
//

import Foundation

extension DateFormatter {
    static let ticketDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return dateFormatter
    }()
    
    static func formatTime(from dateString: String, format: String) -> String {
        guard let date = DateFormatter.ticketDateFormatter.date(from: dateString) else {
            return "no time"
        }
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}

