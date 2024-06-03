//
//  FlightView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 30.05.2024.
//

import SwiftUI

struct FlightsView: View {
    @State private var isShowingModal = false
    @State private var cityDeparture: String = UserDefaults.standard.string(forKey: "lastCityDeparture") ?? ""
    @StateObject var viewModel = FlaightsViewModel()
    @ObservedObject var coordinator = AppCoordinator()
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color.black
                    .ignoresSafeArea()
                ScrollView (.vertical, showsIndicators: false) {
                    VStack {
                        VStack(spacing: 38){
                            Text("Поиск дешевых\n  авиабилетов")
                                .font(AppFonts.semibold22.font)
                                .foregroundColor(AppColors.white)
                            VStack(alignment: .leading, spacing: 32) {
                                SearchCountryTextFieldsView(
                                    isShowingModal: $isShowingModal,
                                    cityDeparture: $cityDeparture)
                                Text("Музыкально отлететь")
                                    .font(AppFonts.semibold22.font)
                                    .foregroundColor(AppColors.white)
                            }
                        }
                        .padding()
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack(spacing: 67) {
                                ForEach(viewModel.flightOffers) { offer in
                                    CollectionCellView(image: Image("image_\(offer.id)"),
                                                       name: Text(offer.name),
                                                       city: Text(offer.city),
                                                       price: Text(PriceFormatter.shared.string(from: offer.price.value))
                                    )
                                }
                            }
                            .padding(.leading, 16)
                        }
                        .onAppear {
                            viewModel.fetchFlightsOffers()
                        }
                        Spacer()
                    }
                    .padding(.top, 26)
                }
            }
        }
    }
}
