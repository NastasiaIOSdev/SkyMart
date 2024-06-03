//
//  SearchCountryTextFieldsView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 03.06.2024.
//

import SwiftUI

struct SearchCountryTextFieldsView: View {
    @Binding var isShowingModal: Bool
    @Binding var cityDeparture: String
    
    var body: some View {
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
                    SearchCityView(cityDeparture: $cityDeparture)
                }
            }
            .padding()
        }
    }
}
