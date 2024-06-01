//
//  Ы.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 01.06.2024.
//

import Foundation

extension String {
    func isCyrillic() -> Bool {
        let cyrillic = "^[а-яА-Я]+$"
        return range(
            of: cyrillic,
            options: .regularExpression)
        != nil
    }
}
