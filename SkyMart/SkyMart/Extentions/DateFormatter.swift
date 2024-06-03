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
    
    static func calculateTimeTraveling(depatureDate: String, arrivalDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        guard let depatureDateTime = dateFormatter.date(from: depatureDate),
              let arrivalDateTime = dateFormatter.date(from: arrivalDate) else {
            return "Нeвозможно рассчитать время"
        }
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute], from: depatureDateTime, to: arrivalDateTime)
        guard let hours = components.hour, let minutes = components.minute else {
            return "Нeвозможно рассчитать время"
        }
        return "\(hours) ч \(minutes) мин"
    }
    
    static func currentDateFormatter() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM, E"
        return dateFormatter.string(from: Date())
    }
    
    static func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM, E"
        return dateFormatter.string(from: date)
    }
}

