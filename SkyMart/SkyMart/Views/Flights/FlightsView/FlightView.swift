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
                                ZStack{
                                    RoundedRectangle(cornerRadius: 16)
                                        .foregroundColor(AppColors.grey3)
                                        .frame(height: 122)
                                    RoundedRectangle(cornerRadius: 16)
                                        .foregroundColor(AppColors.grey4)
                                        .frame(height: 95)
                                        .padding()
                                        .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
                                    HStack {
                                        Image("loop")
                                            .foregroundColor(AppColors.grey6)
                                            .padding(.leading)
                                        VStack(alignment: .leading) {
                                            
                                            TextField(
                                                "",
                                                text: $cityDeparture,
                                                prompt: Text("Откуда - Москва")
                                                .font(AppFonts.medium16.font)
                                                .foregroundColor(AppColors.white)
                                            )
                                            .textContentType(.name)
                                            .font(AppFonts.medium16.font)
                                            .foregroundColor(AppColors.white)
                                            .onChange(of: cityDeparture) { newValue in
                                                UserDefaults.standard.set(newValue, forKey: "lastCityDeparture")
                                                if !newValue.isEmpty && !newValue.isCyrillic() {
                                                    cityDeparture = ""
                                                }
                                            }
                                            .disableAutocorrection(true)
                                            .padding(.trailing)
                                            .textFieldStyle(PlainTextFieldStyle())
                                            Divider()
                                                .background(AppColors.grey6)
                                            Button(action: {
                                                isShowingModal.toggle()
                                            }) {
                                                Text("Куда - Турция")
                                                    .font(AppFonts.medium16.font)
                                                    .foregroundColor(AppColors.grey6)
                                            }
                                        }
                                        .padding()
                                        .sheet(isPresented: $isShowingModal) {
                                            SearchCountryView(cityDeparture: $cityDeparture)
                                        }
                                    }
                                    .padding()
                                }
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

struct FlightsView_Previews: PreviewProvider {
    static var previews: some View {
        FlightsView()
    }
}
