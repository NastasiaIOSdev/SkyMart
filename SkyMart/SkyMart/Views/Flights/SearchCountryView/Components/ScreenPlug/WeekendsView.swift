//
//  WeekendsView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 02.06.2024.
//

import SwiftUI

struct WeekendsView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Text("Выходные")
                    .font(AppFonts.semibold22.font)
                    .foregroundColor(AppColors.blue)
            }
        }
    }
}

struct WeekendsView_Previews: PreviewProvider {
    static var previews: some View {
        WeekendsView()
    }
}
