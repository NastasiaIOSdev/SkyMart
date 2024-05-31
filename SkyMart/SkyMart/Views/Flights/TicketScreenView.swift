//
//  TicketScreenView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 30.05.2024.
//

import SwiftUI

struct TicketScreenView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack(spacing: 16) {
                HStack{
                    Button(action: {
                        dismiss()
                    }) {
                        Image("arrowLeft")
                            .foregroundColor(AppColors.white)
                            .padding(.leading)
                    }
                    Spacer()
                    HStack(spacing: 0){
                        Button(action: {
                            //
                        }) {
                            Image("bell2")
                                .foregroundColor(AppColors.white)
                                .padding(.leading)
                        }
                        Button(action: {
                            //
                        }) {
                            Image("share")
                                .foregroundColor(AppColors.white)
                                .padding(.leading)
                        }
                    }
                    .padding()
                }
                .frame(height: 40)
                ScrollView (.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 16) {
                        ZStack(alignment: .leading){
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(AppColors.grey1)
                                .frame(height: 293)
                            VStack(alignment: .leading) {
                                Text("Дешевый тариф")
                                    .foregroundColor(AppColors.white)
                                    .font(AppFonts.semibold16.font)
                                VStack(spacing: 2) {
                                    HStack{
                                        Image("checkMark")
                                        Text("Ручная кладь 1х5 кг")
                                            .foregroundColor(AppColors.white)
                                            .font(AppFonts.regular14.font)
                                        Spacer()
                                        Text("55х20х40 см")
                                            .foregroundColor(AppColors.grey5)
                                            .font(AppFonts.regular14.font)
                                    }
                                    HStack{
                                        Image("crossMark")
                                        Text("Без багажа")
                                            .foregroundColor(AppColors.white)
                                            .font(AppFonts.regular14.font)
                                        Spacer()
                                    }
                                    HStack{
                                        Image("checkMark")
                                        Text("Обмен платный")
                                            .foregroundColor(AppColors.white)
                                            .font(AppFonts.regular14.font)
                                        Button(action: {
                                            //
                                        }) {
                                            Image("questionMark")
                                            Spacer()
                                            
                                        }
                                        Spacer()
                                    }
                                    HStack{
                                        Image("crossMark")
                                        Text("Без возврата")
                                            .foregroundColor(AppColors.white)
                                            .font(AppFonts.regular14.font)
                                        Button(action: {
                                            //
                                        }) {
                                            Image("questionMark")
                                            Spacer()
                                            
                                        }
                                    }
                                }
                                .frame(height: 110)
                                Spacer()
                                ZStack(alignment: .leading){
                                    RoundedRectangle(cornerRadius: 8)
                                        .foregroundColor(AppColors.grey4)
                                        .frame(height: 102)
                                    VStack{
                                        HStack(spacing: 2) {
                                            Text("Добавить багаж")
                                                .foregroundColor(AppColors.white)
                                                .font(AppFonts.regular16.font)
                                            Text("+ 1 082 ₽")
                                                .foregroundColor(AppColors.blue)
                                                .font(AppFonts.regular16.font)
                                            Spacer()
                                            Button(action: {
                                                //
                                            }) {
                                                Image("switchOn")
                                                    .foregroundColor(AppColors.blue)
                                                
                                            }
                                        }
                                        .padding([.leading, .trailing])
                                        Divider()
                                        .background(AppColors.grey6)
                                                            
                                        HStack(spacing: 2) {
                                            Text("Изменить обмен или возврат")
                                                .foregroundColor(AppColors.white)
                                                .font(AppFonts.regular16.font)
                                            Button(action: {
                                                //
                                            }) {
                                                Image("arrowRight")
                                                    .foregroundColor(AppColors.blue)
                                            }
                                            Spacer()
                                        }
                                        .padding([.leading, .trailing])
                                    }
                                }
                            }
                            .padding()
                        }
                        VStack(alignment: .leading) {
                            Text("Москва-Сочи")
                                .font(AppFonts.semibold16.font)
                                .foregroundColor(AppColors.white)
                            Text("04ч в пути")
                                .foregroundColor(AppColors.grey6)
                                .font(AppFonts.regularItalic14.font)
                        }
                        .frame(height: 40)
                        ZStack{
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(AppColors.grey1)
                                .frame(height: 184)
                            VStack{
                                HStack(alignment: .top,spacing: 10) {
                                    Circle()
                                        .frame(width: 32)
                                        .foregroundColor(.white)
                                    VStack(alignment: .leading) {
                                        Text("Якутия")
                                            .foregroundColor(AppColors.white)
                                            .font(AppFonts.regularItalic14.font)
                                        Text("04ч  в полете")
                                            .foregroundColor(AppColors.grey6)
                                            .font(AppFonts.regularItalic14.font)
                                    }
                                    Spacer()
                                    Button(action: {
                                        //
                                    }) {
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 50)
                                                .foregroundColor(AppColors.grey4)
                                                .frame(width: 102, height: 23)
                                            Text("Подробнее")
                                                .foregroundColor(AppColors.grey6)
                                                .italic()
                                        }
                                    }
                                }
                                HStack(alignment: .top, spacing: 24) {
                                    Image("Откуда-Куда")
                                        .frame(width: 21, height: 50)
                                        .padding(.top, 12)
                                    VStack(alignment: .leading){
                                        HStack{
                                            VStack(alignment: .leading) {
                                                Text("03:15")
                                                    .foregroundColor(AppColors.white)
                                                Text("23 фев, ср")
                                                    .foregroundColor(AppColors.grey6)
                                            }
                                            .padding(.trailing, 16)
                                            VStack(alignment: .leading) {
                                                Text("Москва")
                                                    .foregroundColor(AppColors.white)
                                                Text("Внуково, VKO")
                                                    .foregroundColor(AppColors.grey6)
                                            }
                                        }
                                        
                                        HStack{
                                            VStack(alignment: .leading) {
                                                Text("07:10")
                                                    .foregroundColor(AppColors.white)
                                                Text("23 фев, ср")
                                                    .foregroundColor(AppColors.grey6)
                                            }
                                            .padding(.trailing, 16)
                                            VStack(alignment: .leading) {
                                                Text("Сочи")
                                                    .foregroundColor(AppColors.white)
                                                Text("Адлер, AER")
                                                    .foregroundColor(AppColors.grey6)
                                            }
                                        }
                                        .padding(.top, 12)
                                    }
                                    .font(AppFonts.regularItalic14.font)
                                    Spacer()
                                }
                                
                            }
                            .padding()
                        }
                    }
                    .padding()
                    ZStack {
                        RoundedRectangle(cornerRadius: 0)
                            .foregroundColor(AppColors.grey3)
                            .frame(height: 84)
                        HStack(alignment: .top,spacing: 10) {
                            Circle()
                                .frame(width: 32)
                                .foregroundColor(.white)
                            VStack(alignment: .leading) {
                                Text("6 310 ₽")
                                    .foregroundColor(AppColors.white)
                                    .font(AppFonts.semibold20.font)
                                Text("На сайте Купибилет")
                                    .foregroundColor(AppColors.grey6)
                                    .font(AppFonts.regularItalic14.font)
                            }
                            Spacer()
                            Button(action: {
                                //
                            }) {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 50)
                                        .foregroundColor(AppColors.orange)
                                        .frame(width: 102, height: 33)
                                    Text("Подробнее")
                                        .foregroundColor(AppColors.white)
                                        .font(AppFonts.semibold16.font)
                                }
                            }
                        }
                        .padding()
                    }
                }
                Spacer()
            }
        }
    }
}

struct TicketScreenView_Previews: PreviewProvider {
    static var previews: some View {
        TicketScreenView()
    }
}
