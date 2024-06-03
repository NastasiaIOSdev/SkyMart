//
//  PriceInfoView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 03.06.2024.
//

import SwiftUI

struct PriceInfoView: View {
    var body: some View {
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
}

struct PriceInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PriceInfoView()
    }
}
