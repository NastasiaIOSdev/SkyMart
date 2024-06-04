//
//  TicketScreenView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 30.05.2024.
//

import SwiftUI

struct TicketScreenView: View {
    @Binding var cityDeparture: String
    @Binding var cityArrival: String
    @ObservedObject var coordinator = AppCoordinator()
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack(spacing: 16) {
                BackButtonsView()
                    .frame(height: 40)
                ScrollView (.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 16) {
                        AboutTariffView()
                        VStack(alignment: .leading) {
                            HStack(spacing: 0){
                                Text(cityDeparture)
                                Text("-")
                                Text(cityArrival)
                            }
                                .font(AppFonts.semibold16.font)
                                .foregroundColor(AppColors.white)
                            Text("04ч в пути")
                                .foregroundColor(AppColors.grey6)
                                .font(AppFonts.regularItalic14.font)
                        }
                        .frame(height: 40)
                        FlightDetailsView(
                            cityDeparture: $cityDeparture,
                            cityArrival: $cityArrival)
                    }
                    .padding()
                    PriceInfoView()
                }
                Spacer()
            }
        }
    }
}
