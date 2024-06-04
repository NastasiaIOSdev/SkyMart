//
//  CityHeaderView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 03.06.2024.
//

import SwiftUI

struct CityHeaderView: View {
    @Binding var cityDeparture: String
    @Binding var cityArrival: String
    var dismiss: DismissAction?
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(AppColors.grey2)
                .frame(height: 56)
            HStack {
                Button(action: {
                    dismiss?()
                }) {
                    Image("arrowLeft")
                        .foregroundColor(AppColors.blue)
                        .padding(.leading)
                }
                VStack(alignment: .leading, spacing: 4) {
                    HStack{
                        HStack(spacing: 0) {
                            Text(cityDeparture)
                            Text("-")
                            Text(cityArrival)
                        }
                        .font(AppFonts.semibold16.font)
                        .foregroundColor(AppColors.white)
                        Spacer()
                    }
                    HStack{
                        HStack(spacing: 0) {
                            Text(DateFormatter.currentDateDayFormatter())
                            Text(", 1 пассажир")
                        }
                        .font(AppFonts.semibold14.font)
                        .foregroundColor(AppColors.grey6)
                        Spacer()
                    }
                }
            }
        }
    }
}
