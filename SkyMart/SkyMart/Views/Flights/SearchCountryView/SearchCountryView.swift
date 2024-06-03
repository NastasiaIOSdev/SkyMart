//
//  SearchCountryView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 30.05.2024.
//

import SwiftUI

struct SearchCountryView: View {
    @State private var isClosedModal = false
    @State private var isShowingDifficultRouteViewModal = false
    @State private var isShowingWeekendsViewModal = false
    @State private var isShowingHotTicketsViewModal = false
    @State private var isChooseFlightViewPresented = false
    @State private var searchText = ""
    @State private var selectedCountry: String?
    @State private var cityArrival: String = UserDefaults.standard.string(forKey: "lastCityArrival") ?? ""
    @Binding var cityDeparture: String
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.14, green: 0.15, blue: 0.16)
                    .ignoresSafeArea()
                VStack(spacing: 0) {
                    Button(action: {
                        dismiss()
                    }) {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(AppColors.grey5)
                            .frame(width: 38, height: 5)
                    }
                    VStack(alignment: .leading) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 16)
                                .foregroundColor(AppColors.grey4)
                                .frame(height: 95)
                                .padding()
                                .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
                                VStack(alignment: .leading) {
                                    HStack {
                                        Image("airplane2")
                                            .foregroundColor(AppColors.grey6)
                                            .frame(width: 24)
                                            .padding(.leading)
                                        Text(cityDeparture)
                                            .font(AppFonts.medium16.font)
                                            .foregroundColor(AppColors.white)
                                    }
                                    Divider()
                                        .background(AppColors.grey6)
                                        .padding([.leading, .trailing])
                                    HStack {
                                        Image("loop")
                                            .foregroundColor(AppColors.white)
                                            .frame(width: 24)
                                            .padding(.leading)
                                        TextField(
                                            "",
                                            text: $searchText,
                                            prompt: Text("Куда - Турция")
                                            .font(AppFonts.medium16.font)
                                            .foregroundColor(AppColors.grey6)
                                            )
                                        .textContentType(.name)
                                        .font(AppFonts.medium16.font)
                                        .foregroundColor(AppColors.white)
                                        .onChange(of: cityArrival) { newValue in
                                            UserDefaults.standard.set(newValue, forKey: "lastCityArrival")
                                            if !newValue.isEmpty && !newValue.isCyrillic() {
                                                cityArrival = ""
                                            }
                                        }
                                        .disableAutocorrection(true)
                                        .padding(.trailing)
                                        .textFieldStyle(PlainTextFieldStyle())
                                        Spacer()
                                        Button(action: {
                                            self.searchText = ""
                                        }) {
                                            Image("cross")
                                                .foregroundColor(AppColors.grey7)
                                                .frame(width: 24)
                                                .padding(.trailing)
                                        }
                                    }
                                }
                                .padding()
                                .sheet(isPresented: $isChooseFlightViewPresented) {
                                    ChoosenFlightView(cityDeparture: $cityDeparture, cityArrival: $cityArrival)
                                }
                        }
                    }
                    .padding()
                    ScrollView (.vertical, showsIndicators: false) {
                        VStack {
                            VStack {
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
                                .padding(.leading)
                                .padding(.trailing)
                            }
                            VStack {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 16)
                                        .foregroundColor(AppColors.grey3)
                                        .frame(height: 216)
                                    VStack(alignment: .leading, spacing: 8) {
                                        CountrySelectionRow(image: "countryImage1", country: "Стамбул", isSelected: true) {
                                            selectedCountry = "Стамбул"
                                            self.searchText = "Стамбул"
                                            isChooseFlightViewPresented.toggle()
                                        }
                                        .onTapGesture {
                                            selectedCountry = "Стамбул"
                                            isChooseFlightViewPresented.toggle()
                                        }
                                        
                                        Divider()
                                            .background(AppColors.grey5)
                                            .padding(.bottom,8)
                                        CountrySelectionRow(image: "countryImage2", country: "Сочи", isSelected: true) {
                                            selectedCountry = "Сочи"
                                            self.searchText = "Сочи"
                                            isChooseFlightViewPresented.toggle()
                                        }
                                        .onTapGesture {
                                            selectedCountry = "Сочи"
                                            isChooseFlightViewPresented.toggle()
                                        }
                                        Divider()
                                            .background(AppColors.grey5)
                                            .padding(.bottom,8)
                                        CountrySelectionRow(image: "countryImage3", country: "Пхукет", isSelected: true) {
                                            selectedCountry = "Пхукет"
                                            self.searchText = "Пхукет"
                                            isChooseFlightViewPresented.toggle()
                                        }
                                        .onTapGesture {
                                            selectedCountry = "Пхукет"
                                            isChooseFlightViewPresented.toggle()
                                        }
                                    }
                                    .padding()
                                }
                            }
                            .padding()
                        }
                        .padding()
                    }
                    Spacer()
                }
                .padding(.top, 16)
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

//
//struct SearchCountryView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchCountryView()
//    }
//}

