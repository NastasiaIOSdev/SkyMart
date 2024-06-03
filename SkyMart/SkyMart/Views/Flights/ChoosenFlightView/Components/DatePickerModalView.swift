//
//  DatePickerModalView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 03.06.2024.
//
import SwiftUI

struct DatePickerModalView: View {
    @Binding var isModalPresented: Bool
    @Binding var selectedDate: Date
    var body: some View {
        ZStack {
            Color(red: 0.14, green: 0.15, blue: 0.16)
                .ignoresSafeArea()
            VStack {
                DatePicker("",
                           selection: $selectedDate,
                           displayedComponents: [.date])
                .datePickerStyle(GraphicalDatePickerStyle())
                
                .padding()
                Button("OK") {
                    isModalPresented = false
                }
                .padding()
            }
            .background(.gray)
        }
    }
}
