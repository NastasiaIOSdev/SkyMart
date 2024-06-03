//
//  HotTicketsView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 02.06.2024.
//

import SwiftUI

struct HotTicketsView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Text("Горячие билеты")
                    .font(AppFonts.semibold22.font)
                    .foregroundColor(AppColors.red)
            }
        }    }
}

struct HotTicketsView_Previews: PreviewProvider {
    static var previews: some View {
        HotTicketsView()
    }
}
