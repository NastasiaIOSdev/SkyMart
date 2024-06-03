//
//  FilterView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 03.06.2024.
//

import SwiftUI

struct FilterView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .foregroundColor(AppColors.blue)
                .frame(width: 212, height: 37)
            HStack (spacing: 15){
                Button(action: {
                    //
                }) {
                    HStack(spacing: 2){
                        Image("filter2")
                        Text("Фильтры")
                    }
                }
                Button(action: {
                    //
                }) {
                    HStack(spacing: 2) {
                        Image("charts")
                        Text("График цен")
                    }
                }
            }
            .foregroundColor(AppColors.white)
            .font(AppFonts.regular14.font)
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
