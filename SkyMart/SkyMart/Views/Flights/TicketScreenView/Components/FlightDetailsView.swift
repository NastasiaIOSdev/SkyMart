//
//  FlightDetailsView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 03.06.2024.
//

import SwiftUI

struct FlightDetailsView: View {
    @Binding var cityDeparture: String
    @Binding var cityArrival: String
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(AppColors.grey1)
                .frame(height: 184)
            VStack{
                HStack(alignment: .top,spacing: 10) {
                    Circle()
                        .frame(width: 32)
                        .foregroundColor(.white)
                    VStack(alignment: .leading) {
                        Text(cityDeparture)
                            .foregroundColor(AppColors.white)
                            .font(AppFonts.regularItalic14.font)
                        Text("04ч  в полете")
                            .foregroundColor(AppColors.grey6)
                            .font(AppFonts.regularItalic14.font)
                    }
                    Spacer()
                    Button(action: {
                        //
                    }) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 50)
                                .foregroundColor(AppColors.grey4)
                                .frame(width: 102, height: 23)
                            Text("Подробнее")
                                .foregroundColor(AppColors.grey6)
                                .italic()
                        }
                    }
                }
                HStack(alignment: .top, spacing: 24) {
                    Image("Откуда-Куда")
                        .frame(width: 21, height: 50)
                        .padding(.top, 12)
                    VStack(alignment: .leading){
                        HStack{
                            VStack(alignment: .leading) {
                                Text("03:15")
                                    .foregroundColor(AppColors.white)
                                Text("23 фев, ср")
                                    .foregroundColor(AppColors.grey6)
                            }
                            .padding(.trailing, 16)
                            VStack(alignment: .leading) {
                                Text(cityDeparture)
                                    .foregroundColor(AppColors.white)
                                Text("Внуково, VKO")
                                    .foregroundColor(AppColors.grey6)
                            }
                        }
                        
                        HStack{
                            VStack(alignment: .leading) {
                                Text("07:10")
                                    .foregroundColor(AppColors.white)
                                Text("23 фев, ср")
                                    .foregroundColor(AppColors.grey6)
                            }
                            .padding(.trailing, 16)
                            VStack(alignment: .leading) {
                                Text(cityArrival)
                                    .foregroundColor(AppColors.white)
                                Text("Адлер, AER")
                                    .foregroundColor(AppColors.grey6)
                            }
                        }
                        .padding(.top, 12)
                    }
                    .font(AppFonts.regularItalic14.font)
                    Spacer()
                }
                
            }
            .padding()
        }
    }
}
