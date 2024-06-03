//
//  AboutTariffView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 03.06.2024.
//

import SwiftUI

struct AboutTariffView: View {
    var body: some View {
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
    }
}

struct AboutTariffView_Previews: PreviewProvider {
    static var previews: some View {
        AboutTariffView()
    }
}
