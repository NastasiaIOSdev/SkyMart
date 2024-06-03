//
//  SearchFieldView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 03.06.2024.
//

import SwiftUI

struct SearchFieldView: View {
    @Binding var searchText: String
    @Binding var cityArrival: String
    @Binding var isChooseFlightViewPresented: Bool
    @Binding var cityDeparture: String
    
    var body: some View {
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
}
