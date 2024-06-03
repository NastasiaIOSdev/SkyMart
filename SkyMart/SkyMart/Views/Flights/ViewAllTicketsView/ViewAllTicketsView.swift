//
//  ViewAllTicketsView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 30.05.2024.
//

import SwiftUI

struct ViewAllTicketsView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = AllTicketsViewModel()
    @State private var isTicketScreenViewPresented = false
    var body: some View {
        NavigationView {
            ZStack {
                Color(.black)
                    .ignoresSafeArea()
                VStack(spacing: 16) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 0)
                            .foregroundColor(AppColors.grey2)
                            .frame(height: 56)
                        HStack {
                            Button(action: {
                                dismiss()
                            }) {
                                Image("arrowLeft")
                                    .foregroundColor(AppColors.blue)
                                    .padding(.leading)
                            }
                            VStack(alignment: .leading, spacing: 4) {
                                HStack{
                                    HStack(spacing: 0) {
                                        Text("Москва")
                                        Text("-")
                                        Text("Сочи")
                                    }
                                    .font(AppFonts.semibold16.font)
                                    .foregroundColor(AppColors.white)
                                    Spacer()
                                }
                                HStack{
                                    HStack(spacing: 0) {
                                        Text("23 февраля")
                                        Text(", 1 пассажир")
                                    }
                                    .font(AppFonts.semibold14.font)
                                    .foregroundColor(AppColors.grey6)
                                    Spacer()
                                }
                            }
                        }
                    }
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
                                        travelTime: Text(DateFormatter.calculateTimeTraveling(depatureDate: ticket.departure.date, arrivalDate: ticket.arrival.date)),
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
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                            .foregroundColor(AppColors.blue)
                            .frame(width: 212, height: 37)
                        HStack (spacing: 15){
                            Button(action: {
                                //
                            }) {
                                HStack(spacing: 2){
                                    Image("filter2")
                                    Text("Фильтры")
                                }
                            }
                            Button(action: {
                                //
                            }) {
                                HStack(spacing: 2) {
                                    Image("charts")
                                    Text("График цен")
                                }
                            }
                        }
                        .foregroundColor(AppColors.white)
                        .font(AppFonts.regular14.font)
                    }
                }
            }
            .navigationBarHidden(true)
            .sheet(isPresented: $isTicketScreenViewPresented) {
                TicketScreenView()
            }
        }
    }
}

struct ViewAllTicketsView_Previews: PreviewProvider {
    static var previews: some View {
        ViewAllTicketsView()
    }
}

