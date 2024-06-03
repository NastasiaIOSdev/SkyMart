//
//  SearchCountryView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 30.05.2024.
//

import SwiftUI

struct SearchCityView: View {
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
    @ObservedObject var coordinator = AppCoordinator()
    
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
                        SearchFieldView(
                            searchText: $searchText,
                            cityArrival: $cityArrival,
                            isChooseFlightViewPresented: $isChooseFlightViewPresented,
                            cityDeparture: $cityDeparture)
                    }
                    .padding()
                    ScrollView (.vertical, showsIndicators: false) {
                        VStack {
                            VStack {
                                FlightTipsView(
                                    isShowingDifficultRouteViewModal: $isShowingDifficultRouteViewModal,
                                    isShowingWeekendsViewModal: $isShowingWeekendsViewModal,
                                    isShowingHotTicketsViewModal: $isShowingHotTicketsViewModal,
                                    isChooseFlightViewPresented: $isChooseFlightViewPresented,
                                    searchText: $searchText)
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
            .onAppear {
                DispatchQueue.main.async {
                    UIApplication.shared.windows.first?.rootViewController?.view.subviews.first(where: { $0 is UITextField})?.becomeFirstResponder()
                }
            }
        }
    }
}
