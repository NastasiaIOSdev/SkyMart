//
//  TicketRecommendationsView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 03.06.2024.
//

import SwiftUI

struct TicketRecommendationsView: View {
    @StateObject var viewModel = TicketsViewModel()
    @Binding var isViewAllTicketsViewPresented: Bool
    let colors: [Color] = [AppColors.red, AppColors.blue, AppColors.white]
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(AppColors.grey1)
                .frame(height: 288)
            VStack(alignment: .leading, spacing: 8) {
                Text("Прямые рельсы")
                    .foregroundColor(AppColors.white)
                    .font(AppFonts.semibold20.font)
                    .multilineTextAlignment(.leading)
                VStack {
                    ForEach(Array(viewModel.ticketsOffers.enumerated()), id: \.element.id) { index, ticket in
                        DirectFlightsCellView(
                            title: Text(ticket.title),
                            time: Text(ticket.time.joined(separator: ", ")),
                            price: Text(PriceFormatter.shared.string(from: ticket.price.value)),
                            color: colors[index % colors.count]
                        )
                        Divider()
                            .background(.white)
                    }
                }
                .onAppear {
                    viewModel.fetchTicketsOffers()
                }
                .padding(.top, 8)
                
                Button(action: {
                    //
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(.clear)
                            .frame(height: 42)
                        Text("Показать все")
                            .foregroundColor(AppColors.blue)
                    }
                    .onTapGesture {
                        isViewAllTicketsViewPresented.toggle()
                    }
                    
                }
            }
            .padding(.top)
            .padding(.bottom, 6)
            .padding()
        }
    }
}
