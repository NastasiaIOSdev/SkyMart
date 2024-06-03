//
//  DifficultRouteView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 02.06.2024.
//

import SwiftUI

struct DifficultRouteView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Text("Сложный маршрут")
                    .font(AppFonts.semibold22.font)
                    .foregroundColor(AppColors.green)
            }
        }
    }
}

struct DifficultRouteView_Previews: PreviewProvider {
    static var previews: some View {
        DifficultRouteView()
    }
}
