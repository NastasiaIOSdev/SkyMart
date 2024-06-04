//
//  ChoosenFlightView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 30.05.2024.
//

import SwiftUI

struct ChoosenFlightView: View {
    @State private var isViewAllTicketsViewPresented = false
    @State private var isDatePickerModalPresented = false
    @State private var changeCity: String = ""
    @State private var selectedDate = Date()
    @State private var timeArrival = Date()
    @State private var arrivalDateButtonText = "+ обратно"
    @Environment(\.dismiss) var dismiss
    @Binding var cityDeparture: String
    @Binding var cityArrival: String
    @ObservedObject var coordinator = AppCoordinator()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                VStack(spacing: 47) {
                    VStack(alignment: .leading, spacing: 16) {
                        CitySearchView(
                            changeCity: $changeCity,
                            cityDeparture: $cityDeparture,
                            cityArrival: $cityArrival,
                            dismiss: dismiss)
                        ScrollView (.horizontal, showsIndicators: false) {
                            GorizontalScrollDateInformationView(
                                isDatePickerModalPresented: $isDatePickerModalPresented,
                                timeArrival: $timeArrival,
                                selectedDate: $selectedDate,
                                arrivalDateButtonText: $arrivalDateButtonText)
                        }
                        
                        ScrollView (.vertical, showsIndicators: false) {
                            VStack {
                                TicketRecommendationsView(
                                    isViewAllTicketsViewPresented: $isViewAllTicketsViewPresented)
                                
                            }
                            ViewAllTicketsButtonView(
                                isViewAllTicketsViewPresented: $isViewAllTicketsViewPresented)
                            SubscriptionToThePriceView()
                        }
                    }
                    Spacer()
                }
                .padding()
            }
            .navigationBarHidden(true)
            .sheet(isPresented: $isViewAllTicketsViewPresented) {
                ViewAllTicketsView(cityDeparture: $cityDeparture, cityArrival: $cityArrival)
            }
        }
    }
}
