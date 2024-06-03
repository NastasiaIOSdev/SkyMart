//
//  CountrySelectionRow.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 03.06.2024.
//

import SwiftUI

struct CountrySelectionRow: View {
    var image: String
    var country: String
    var isSelected: Bool
    var onTap: () -> Void
    
    var body: some View {
        HStack {
            Image(image).frame(width: 40)
            VStack(alignment: .leading){
                Text(country)
                    .foregroundColor(AppColors.white)
                    .font(AppFonts.semibold16.font)
                Text("Популярные направления")
                    .foregroundColor(AppColors.grey5)
                    .font(AppFonts.regular14.font)
            }
        }
        .onTapGesture {
            onTap()
        }
    }
}
