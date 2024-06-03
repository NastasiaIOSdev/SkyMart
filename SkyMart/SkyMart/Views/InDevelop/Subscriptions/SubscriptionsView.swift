//
//  SubscriptionsView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 30.05.2024.
//

import SwiftUI

struct SubscriptionsView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Text("Subscriptions")
                    .font(AppFonts.semibold22.font)
                    .foregroundColor(AppColors.white)
            }
        }
    }
}
