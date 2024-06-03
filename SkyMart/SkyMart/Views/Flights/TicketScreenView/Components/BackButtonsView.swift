//
//  BackButtonsView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 03.06.2024.
//

import SwiftUI

struct BackButtonsView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        HStack{
            Button(action: {
                dismiss()
            }) {
                Image("arrowLeft")
                    .foregroundColor(AppColors.white)
                    .padding(.leading)
            }
            Spacer()
            HStack(spacing: 0){
                Button(action: {
                    //
                }) {
                    Image("bell2")
                        .foregroundColor(AppColors.white)
                        .padding(.leading)
                }
                Button(action: {
                    //
                }) {
                    Image("share")
                        .foregroundColor(AppColors.white)
                        .padding(.leading)
                }
            }
            .padding()
        }
    }
}

struct BackButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonsView()
    }
}
