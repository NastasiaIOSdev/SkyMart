//
//  ChooseFlightView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 30.05.2024.
//

import SwiftUI

struct ChooseFlightView: View {
    var selectedCountry: String
    var dismiss: () -> Void
    
    var body: some View {
        Color(red: 0.14, green: 0.15, blue: 0.16)
            .ignoresSafeArea()
        VStack{
            Text(" Страна \(selectedCountry)")
                .foregroundColor(AppColors.black)
                .font(AppFonts.semibold16.font)
            Button("<") {
                dismiss()
            }
            .foregroundColor(.blue)
            .padding()
        }
    }
}

struct ChooseFlightView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseFlightView(selectedCountry: "Пхукет ", dismiss: {})
    }
}
