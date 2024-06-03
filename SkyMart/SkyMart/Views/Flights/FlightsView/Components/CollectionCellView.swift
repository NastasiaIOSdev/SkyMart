//
//  CollectionCellView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 03.06.2024.
//

import SwiftUI

struct CollectionCellView: View {
    let image: Image
    let name: Text
    let city: Text
    let price: Text
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            image
                .resizable()
                .frame(width: 132, height: 132)
                .cornerRadius(16)
            name
                .font(AppFonts.semibold16.font)
                .foregroundColor(AppColors.white)
            city
                .font(AppFonts.regular14.font)
                .foregroundColor(AppColors.white)
            HStack(spacing: 4){
                Image("airplane")
                    .frame(width: 16)
                Text("от")
                price
                Text("₽")
            }
            .font(AppFonts.regular14.font)
            .foregroundColor(AppColors.white)
        }
        .frame(width: 132, height: 213)
    }
}
