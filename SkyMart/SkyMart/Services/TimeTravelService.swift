//
//  TimeTravelService.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 03.06.2024.
//

import Foundation

final class TimeTravelService {
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
}
