//
//  FlightView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 30.05.2024.
//

import SwiftUI

struct FlightsView: View {
    @State private var isShowingModal = false
    let name = ["Die Antwoord", "Socrat& Lera"]
    let city = ["Будапешт", "Санкт- Петербург"]
    let price = ["22 264", "2 390"]
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
                                            Text("Mинск")
                                                .font(AppFonts.medium16.font)
                                                .foregroundColor(AppColors.white)
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
                                            SearchCountryView()
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
                                ForEach(0 ..< 2) { index in
                                    CollectionCellView(image: Image("image_\(index + 1)"), name: Text(name[index]), city: Text(city[index]), price: Text(price[index]))
                                }
                            }
                            .padding(.leading, 16)
                        }
                        Spacer()
                    }
                    .padding(.top, 26)
                }
            }
        }
    }
}

struct CollectionCellView: View {
    let image: Image
    let name: Text
    let city: Text
    let price: Text
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            image
                .resizable()
                .frame(width: 132, height: 132)
                .cornerRadius(16)
            name
                .font(AppFonts.semibold16.font)
                .foregroundColor(AppColors.white)
            city
                .font(AppFonts.regular14.font)
                .foregroundColor(AppColors.white)
            HStack{
                Image("airplane")
                    .foregroundColor(AppColors.white)
                    .frame(width: 17)
                Text("от")
                    .font(AppFonts.regular14.font)
                    .foregroundColor(AppColors.white)
                price
                    .font(AppFonts.regular14.font)
                    .foregroundColor(AppColors.white)
                Text("₽")
                    .font(AppFonts.regular14.font)
                    .foregroundColor(AppColors.white)
            }
        }
        .frame(width: 132, height: 213)
    }
}

struct FlightsView_Previews: PreviewProvider {
    static var previews: some View {
        FlightsView()
    }
}
