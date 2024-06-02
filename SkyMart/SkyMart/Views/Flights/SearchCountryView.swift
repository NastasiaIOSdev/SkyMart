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
    @Binding var cityDeparture: String
    @Environment(\.dismiss) var dismiss
    @State private var searchText = "Куда - Турция"
    @State private var selectedCountry: String?
    @State private var isChooseFlightViewPresented = false
    @State private var cityArrival: String = UserDefaults.standard.string(forKey: "lastCityArrival") ?? ""
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
                                            self.searchText = "Coчи"
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
                                            isChooseFlightViewPresented.toggle()
                                        }
                                        .onTapGesture {
                                            selectedCountry = "Сочи"
                                            self.searchText = "Сочи"
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
            .sheet(isPresented: $isChooseFlightViewPresented) {
                ChoosenFlightView(cityDeparture: $cityDeparture, cityArrival: $cityArrival)
            }
        }
    }
}

struct CountrySelectionRow: View {
    var image: String
    var country: String
    var isSelected: Bool
    var onTap: () -> Void
    
    var body: some View {
        HStack {
            Image(image).frame(width: 40)
            VStack(alignment: .leading){
                Text(country)
                    .foregroundColor(AppColors.white)
                    .font(AppFonts.semibold16.font)
                Text("Популярные направления")
                    .foregroundColor(AppColors.grey5)
                    .font(AppFonts.regular14.font)
            }
        }
        .onTapGesture {
                  onTap()
              }
    }
}
//
//struct SearchCountryView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchCountryView()
//    }
//}

