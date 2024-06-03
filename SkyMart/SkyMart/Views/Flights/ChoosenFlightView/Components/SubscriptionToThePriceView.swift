//
//  SubscriptionToThePriceView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 03.06.2024.
//

import SwiftUI

struct SubscriptionToThePriceView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(AppColors.grey2)
                .frame(height: 51)
            HStack {
                Image("bell")
                    .foregroundColor(AppColors.blue)
                Text("Подписка на цену")
                    .foregroundColor(AppColors.white)
                    .font(AppFonts.regular16.font)
                    .multilineTextAlignment(.leading)
                Spacer()
                Button(action: {
                    //
                }) {
                    Image("switchOff")
                        .foregroundColor(AppColors.white)
                }
            }
            .padding()
        }
    }
}

struct SubscriptionToThePriceView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionToThePriceView()
    }
}
