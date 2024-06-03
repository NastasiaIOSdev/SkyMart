//
//  TicketScreenView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 30.05.2024.
//

import SwiftUI

struct TicketScreenView: View {
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
                            Text("Москва-Сочи")
                                .font(AppFonts.semibold16.font)
                                .foregroundColor(AppColors.white)
                            Text("04ч в пути")
                                .foregroundColor(AppColors.grey6)
                                .font(AppFonts.regularItalic14.font)
                        }
                        .frame(height: 40)
                        FlightDetailsView()
                    }
                    .padding()
                    PriceInfoView()
                }
                Spacer()
            }
        }
    }
}

struct TicketScreenView_Previews: PreviewProvider {
    static var previews: some View {
        TicketScreenView()
    }
}
