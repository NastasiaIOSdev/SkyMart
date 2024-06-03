//
//  FlightTipsView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 03.06.2024.
//

import SwiftUI

struct FlightTipsView: View {
    @Binding var isShowingDifficultRouteViewModal: Bool
    @Binding var isShowingWeekendsViewModal: Bool
    @Binding var isShowingHotTicketsViewModal: Bool
    @Binding var isChooseFlightViewPresented: Bool
    @Binding var searchText: String
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .center) {
                Button(action: {
                    isShowingDifficultRouteViewModal.toggle()
                }) {
                    Image("searchButton1")
                        .frame(width: 48)
                }
                Text("Сложный маршрут")
                    .foregroundColor(AppColors.white)
                    .font(AppFonts.regular14.font)
                    .multilineTextAlignment(.center)
            }
            .frame(width: 70)
            .sheet(isPresented: $isShowingDifficultRouteViewModal) {
                DifficultRouteView()
            }
            Spacer()
            VStack(alignment: .center) {
                Button(action: {
                    self.searchText = "Санкт-Петербург"
                    self.isChooseFlightViewPresented.toggle()
                }) {
                    Image("searchButton2")
                        .frame(width: 48)
                }
                Text("Куда угодно")
                    .foregroundColor(AppColors.white)
                    .font(AppFonts.regular14.font)
                    .multilineTextAlignment(.center)
            }
            .frame(width: 90)
            Spacer()
            VStack(alignment: .center) {
                Button(action: {
                    isShowingWeekendsViewModal.toggle()
                }) {
                    Image("searchButton3")
                        .frame(width: 48)
                }
                Text("Выходные")
                    .foregroundColor(AppColors.white)
                    .font(AppFonts.regular14.font)
                    .multilineTextAlignment(.center)
            }
            .frame(width: 70)
            .sheet(isPresented: $isShowingWeekendsViewModal) {
                WeekendsView()
            }
            Spacer()
            VStack(alignment: .center) {
                Button(action: {
                    isShowingHotTicketsViewModal.toggle()
                }) {
                    Image("searchButton4")
                        .frame(width: 48)
                }
                Text("Горячие билеты")
                    .foregroundColor(AppColors.white)
                    .font(AppFonts.regular14.font)
                    .multilineTextAlignment(.center)
            }
            .frame(width: 70)
            .sheet(isPresented: $isShowingHotTicketsViewModal) {
                HotTicketsView()
            }
        }
    }
}
