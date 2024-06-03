//
//  DirectFlightsCellView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 03.06.2024.
//
import SwiftUI

struct DirectFlightsCellView: View {
    let title: Text
    let time: Text
    let price: Text
    var body: some View {
        Button(action: {
            //
        }) {
            ZStack {
                HStack(alignment: .top) {
                    Circle()
                        .frame(width: 24, height: 24)
                        .foregroundColor(AppColors.white)
                    VStack(alignment: .leading) {
                        HStack{
                            title
                                .foregroundColor(AppColors.white)
                                .italic()
                            Spacer()
                            HStack {
                                price
                                Text("₽")
                                Image("arrowRight")
                            }
                            .font(AppFonts.medium16.font)
                            .foregroundColor(AppColors.blue)
                        }
                        time
                            .foregroundColor(AppColors.white)
                            .font(AppFonts.regular14.font)
                            .lineLimit(1)
                    }
                }
            }
            .padding(.top, 4)
        }
    }
}
