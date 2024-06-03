//
//  CitySearchView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 03.06.2024.
//

import SwiftUI

struct CitySearchView: View {
    @Binding var changeCity: String
    @Binding var cityDeparture: String
    @Binding var cityArrival: String
    var dismiss: DismissAction?
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(AppColors.grey4)
                .frame(height: 95)
                .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
            HStack {
                Button(action: {
                    dismiss?()
                }) {
                    Image("arrowLeft")
                        .foregroundColor(AppColors.white)
                        .padding(.leading)
                }
                VStack(alignment: .leading) {
                    HStack{
                        Text(cityDeparture)
                            .font(AppFonts.medium16.font)
                            .foregroundColor(AppColors.white)
                        Spacer()
                        Button(action: {
                            changeCity = cityDeparture
                            cityDeparture = cityArrival
                            cityArrival = changeCity
                        }) {
                            Image("change")
                                .foregroundColor(AppColors.grey7)
                                .frame(width: 24)
                                .padding(.trailing)
                        }
                        
                    }
                    Divider()
                        .background(AppColors.grey6)
                        .padding(.trailing)
                    HStack{
                        Text(cityArrival)
                            .font(AppFonts.medium16.font)
                            .foregroundColor(AppColors.white)
                        Spacer()
                        Button(action: {
                            cityArrival = ""
                        }) {
                            Image("cross")
                                .foregroundColor(AppColors.grey7)
                                .frame(width: 24)
                                .padding(.trailing)
                        }
                    }
                }
            }
        }
    }
}
