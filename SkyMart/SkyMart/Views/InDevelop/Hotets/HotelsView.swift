//
//  HotelsView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 30.05.2024.
//

import SwiftUI

struct HotelsView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Text("Hotels")
                    .font(AppFonts.semibold22.font)
                    .foregroundColor(AppColors.white)
            }
        }
    }
}
