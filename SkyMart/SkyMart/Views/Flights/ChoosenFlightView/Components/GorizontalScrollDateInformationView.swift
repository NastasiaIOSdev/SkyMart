//
//  TicketRecommendationsView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 03.06.2024.
//
import SwiftUI

struct GorizontalScrollDateInformationView: View {
    @Binding var isDatePickerModalPresented: Bool
    @Binding var timeArrival: Date
    @Binding var selectedDate: Date
    @Binding var arrivalDateButtonText: String
    var name: [String] {
        ["1,эконом", ""]
    }
    let image = ["human", "Icon"]
    private var returnButtonText: String {
        if selectedDate == nil {
            return "+ Обратно"
            
        } else {
            return DateFormatter.formatDate(selectedDate)
        }
    }
    var body: some View {
        HStack(spacing: 8) {
            Button(action: {
                isDatePickerModalPresented.toggle()
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(AppColors.grey3)
                        .frame(height: 33)
                    HStack {
                        if isDatePickerModalPresented {
                            Text(returnButtonText)
                                .foregroundColor(.white)
                                .italic()
                        } else {
                            Text(arrivalDateButtonText)
                                .foregroundColor(.white)
                                .italic()
                        }
                        
                    }
                    .padding([.leading, .trailing])
                }
            }
            .sheet(isPresented: $isDatePickerModalPresented) {
                DatePickerModalView(isModalPresented: $isDatePickerModalPresented, selectedDate: $timeArrival)
                    .onDisappear {
                        if timeArrival != selectedDate {
                            selectedDate = timeArrival
                            arrivalDateButtonText = DateFormatter.formatDate(selectedDate)
                        }
                    }
            }
            Button(action: {
                //
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(AppColors.grey3)
                        .frame(height: 33)
                    HStack {
                        Text(DateFormatter.currentDateFormatter())
                            .foregroundColor(.white)
                            .italic()
                    }
                    .padding([.leading, .trailing])
                }
            }
            ForEach(0 ..< 2) { index in
                FilterCellView(image: Image(image[index] ?? ""), name: Text(name[index]))
                
            }
        }
    }
}

