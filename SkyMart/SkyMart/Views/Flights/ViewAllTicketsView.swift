//
//  ViewAllTicketsView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 30.05.2024.
//

import SwiftUI

struct ViewAllTicketsView: View {
    @Environment(\.dismiss) var dismiss
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
                                    Text("Москва-Сочи")
                                        .font(AppFonts.semibold16.font)
                                        .foregroundColor(AppColors.white)
                                    Spacer()
                                }
                                HStack{
                                    Text("Сочи")
                                        .font(AppFonts.medium16.font)
                                        .foregroundColor(AppColors.white)
                                    Spacer()
                                }
                            }
                        }
                    }
                    .padding([.leading, .trailing])
                    ScrollView {
                        VStack {
                        Button(action: {
                            //
                        }) {
                            ZStack {
                                
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(AppColors.grey1)
                                    .frame(height: 120)
                                ZStack {
                                    RoundedRectangle(cornerRadius: 50)
                                        .foregroundColor(AppColors.blue)
                                        .frame(width: 143, height: 31)
                                    Text("Самый удобный")
                                        .foregroundColor(AppColors.white)
                                        .italic()
                                }
                                .padding(.trailing, 215)
                                .padding(.bottom, 120)
                                
                                
                                VStack(alignment: .leading) {
                                    Text("7 386 ₽ ")
                                        .foregroundColor(AppColors.white)
                                        .font(AppFonts.semibold22.font)
                                    HStack {
                                        HStack {
                                            Circle()
                                                .frame(width: 24)
                                                .foregroundColor(AppColors.red)
                                            
                                        }
                                        HStack(alignment: .top) {
                                            VStack(alignment: .leading) {
                                                Text("12:00")
                                                    .foregroundColor(AppColors.white)
                                                    .italic()
                                                Text("DME")
                                                    .foregroundColor(AppColors.grey6)
                                                    .italic()
                                                    .lineLimit(1)
                                            }
                                            Image("line")
                                                .foregroundColor(AppColors.grey6)
                                                .padding(.top, 9)
                                            VStack(alignment: .leading) {
                                                Text("15:35")
                                                    .foregroundColor(AppColors.white)
                                                    .italic()
                                                Text("AER")
                                                    .foregroundColor(AppColors.grey6)
                                                    .italic()
                                                    .lineLimit(1)
                                            }
                                            VStack(alignment: .leading) {
                                                Text("3.5ч в пути / Без пересадок")
                                                    .foregroundColor(AppColors.white)
                                                    .font(AppFonts.regular14.font)
                                                    .lineLimit(1)
                                            }
                                            .padding(.leading, 7)
                                            Spacer()
                                        }
                                    }
                                }
                                .padding()
                            }
                            .padding(.top)
                            .onTapGesture {
                                isTicketScreenViewPresented.toggle()
                            }
                          }
                        }
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
                .padding()
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
