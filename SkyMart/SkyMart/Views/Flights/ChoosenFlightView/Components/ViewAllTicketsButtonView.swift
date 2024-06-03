//
//  ViewAllTicketsButtonView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 03.06.2024.
//

import SwiftUI

struct ViewAllTicketsButtonView: View {
    @Binding var isViewAllTicketsViewPresented: Bool
    var body: some View {
        Button(action: {
            //
        }) {
            ZStack{
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(AppColors.blue)
                    .frame(height: 42)
                Text("Посмотреть все билеты")
                    .italic()
                    .foregroundColor(AppColors.white)
                    .onTapGesture {
                        isViewAllTicketsViewPresented.toggle()
                    }
            }
        }
    }
}
