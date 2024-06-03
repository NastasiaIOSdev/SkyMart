//
//  InShortView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 30.05.2024.
//

import SwiftUI

struct InShortView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Text("InShort")
                    .font(AppFonts.semibold22.font)
                    .foregroundColor(AppColors.white)
            }
        }
    }
}
