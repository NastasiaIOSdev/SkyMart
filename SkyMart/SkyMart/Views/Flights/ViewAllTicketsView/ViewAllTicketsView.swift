//
//  ViewAllTicketsView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 30.05.2024.
//

import SwiftUI

struct ViewAllTicketsView: View {
    
    @Binding var cityDeparture: String
    @Binding var cityArrival: String
    @StateObject var viewModel = AllTicketsViewModel()
    @State private var isTicketScreenViewPresented = false
    @ObservedObject var coordinator = AppCoordinator()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            ZStack {
                Color(.black)
                    .ignoresSafeArea()
                VStack(spacing: 16) {
                    CityHeaderView(cityDeparture: $cityDeparture, cityArrival: $cityArrival, dismiss: dismiss)
                                        .padding([.leading, .trailing])
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 4) {
                            ForEach(viewModel.allTicketsOffers) { ticket in
                                Button(action: {
                                    //
                                }) {
                                    AllTicketsRowView (
                                        badge: Text(ticket.badge ?? " "),
                                        price: Text(PriceFormatter.shared.string(from: ticket.price.value)
                                                   ),
                                        depatureTime: Text(DateFormatter.formatTime(from: ticket.departure.date, format: "HH:mm")),
                                        depatureAirport: Text(ticket.departure.airport.rawValue),
                                        arivalTime: Text(DateFormatter.formatTime(from: ticket.arrival.date, format: "HH:mm")),
                                        arivalAirport: Text(ticket.arrival.airport.rawValue),
                                        travelTime: Text(TimeTravelService.calculateTimeTraveling(depatureDate: ticket.departure.date, arrivalDate: ticket.arrival.date)),
                                        hasTransfer: Text(ticket.hasTransfer ? "" : " / Без пересадок"),
                                        badgeColor: ticket.badge != nil ? .blue : nil
                                    )
                                    .onTapGesture {
                                        isTicketScreenViewPresented.toggle()
                                    }
                                }
                            }
                        }
                        .padding(0)
                    }
                    .onAppear {
                        viewModel.fetchAllFlaightsOffers()
                    }
                    Spacer()
                    FilterView()
                }
            }
            .navigationBarHidden(true)
            .sheet(isPresented: $isTicketScreenViewPresented) {
                TicketScreenView(
                    cityDeparture: $cityDeparture,
                    cityArrival: $cityArrival)
            }
        }
    }
}

