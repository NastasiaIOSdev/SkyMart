//
//  AllTicketsRowView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 03.06.2024.
//

import SwiftUI

struct AllTicketsRowView: View {
    let badge: Text
    let price: Text
    let depatureTime: Text
    let depatureAirport: Text
    let arivalTime: Text
    let arivalAirport: Text
    let travelTime: Text
    let hasTransfer: Text
    let badgeColor: Color?
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(AppColors.grey1)
                .padding([.leading, .trailing], 16)
                .frame(height: 120)
            if let badge = badge {
                ZStack {
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundColor(badgeColor)
                        .opacity(badgeColor != nil ? 1 : 0)
                        .frame(width: 143, height: 31)
                    badge
                        .foregroundColor(AppColors.white)
                        .italic()
                }
                .padding(.leading)
                .padding(.bottom, 115)
            } else {
                EmptyView()
            }
            
            VStack(alignment: .leading) {
                HStack{
                    price
                    Text("₽")
                }
                .padding(.leading)
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
                            depatureTime
                                .foregroundColor(AppColors.white)
                                .lineLimit(1)
                                .font(AppFonts.regularItalic14.font)
                            depatureAirport
                                .foregroundColor(AppColors.grey6)
                                .font(AppFonts.regularItalic14.font)
                                
                        }
                        Image("line")
                            .foregroundColor(AppColors.grey6)
                            .padding(.top, 9)
                        VStack(alignment: .leading) {
                            arivalTime
                                .foregroundColor(AppColors.white)
                                .lineLimit(1)
                                .font(AppFonts.regularItalic14.font)
                            arivalAirport
                                .foregroundColor(AppColors.grey6)
                                .font(AppFonts.regularItalic14.font)
                        }
                        VStack(alignment: .leading) {
                            HStack(spacing: 0) {
                                travelTime
                                Text(" в пути")
                                hasTransfer
                            }
                            .foregroundColor(AppColors.white)
                            .font(AppFonts.regular14.font)
                            .lineLimit(1)
                        }
                        .padding(.leading, 7)
                        Spacer()
                    }
                }
                .padding([.leading, .trailing])
            }
            .padding()
        }
    }
}
