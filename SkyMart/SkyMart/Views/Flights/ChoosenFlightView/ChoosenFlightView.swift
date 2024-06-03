//
//  ChoosenFlightView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 30.05.2024.
//

import SwiftUI

struct ChoosenFlightView: View {
    @State private var isViewAllTicketsViewPresented = false
    @State private var isDatePickerModalPresented = false
    @State private var changeCity: String = ""
    @State private var selectedDate = Date()
    @State private var timeArrival = Date()
    @State private var arrivalDateButtonText = "+ обратно"
    @Environment(\.dismiss) var dismiss
    @Binding var cityDeparture: String
    @Binding var cityArrival: String
    @StateObject var viewModel = TicketsViewModel()
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
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                VStack(spacing: 47) {
                    VStack(alignment: .leading, spacing: 16) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .foregroundColor(AppColors.grey4)
                                .frame(height: 95)
                                .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
                            HStack {
                                Button(action: {
                                    dismiss()
                                }) {
                                    Image("arrowLeft")
                                        .foregroundColor(AppColors.white)
                                        .padding(.leading)
                                }
                                VStack(alignment: .leading) {
                                    HStack{
                                        Text(cityDeparture)
                                            .font(AppFonts.medium16.font)
                                            .foregroundColor(AppColors.white)
                                        Spacer()
                                        Button(action: {
                                            changeCity = cityDeparture
                                            cityDeparture = cityArrival
                                            cityArrival = changeCity
                                        }) {
                                            Image("change")
                                                .foregroundColor(AppColors.grey7)
                                                .frame(width: 24)
                                                .padding(.trailing)
                                        }
                                        
                                    }
                                    Divider()
                                        .background(AppColors.grey6)
                                        .padding(.trailing)
                                    HStack{
                                        Text(cityArrival)
                                            .font(AppFonts.medium16.font)
                                            .foregroundColor(AppColors.white)
                                        Spacer()
                                        Button(action: {
                                            cityArrival = ""
                                        }) {
                                            Image("cross")
                                                .foregroundColor(AppColors.grey7)
                                                .frame(width: 24)
                                                .padding(.trailing)
                                        }
                                    }
                                }
                            }
                        }
                        ScrollView (.horizontal, showsIndicators: false) {
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
                        
                        ScrollView (.vertical, showsIndicators: false) {
                            VStack {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 8)
                                        .foregroundColor(AppColors.grey1)
                                        .frame(height: 288)
                                    VStack(alignment: .leading, spacing: 8) {
                                        Text("Прямые рейльсы")
                                            .foregroundColor(AppColors.white)
                                            .font(AppFonts.semibold20.font)
                                            .multilineTextAlignment(.leading)
                                        VStack {
                                            ForEach(viewModel.ticketsOffers) { ticket in
                                                DirectFlightsCellView(
                                                    title: Text(ticket.title),
                                                    time: Text(ticket.time.joined(separator: ", ")),
                                                    price: Text(PriceFormatter.shared.string(from: ticket.price.value))
                                                )
                                                Divider()
                                                    .background(.white)
                                            }
                                        }
                                        .onAppear {
                                            viewModel.fetchTicketsOffers()
                                        }
                                        .padding(.top, 8)
                                        
                                        Button(action: {
                                            //
                                        }) {
                                            ZStack {
                                                RoundedRectangle(cornerRadius: 8)
                                                    .foregroundColor(.clear)
                                                    .frame(height: 42)
                                                Text("Показать все")
                                                    .foregroundColor(AppColors.blue)
                                            }
                                            .onTapGesture {
                                                isViewAllTicketsViewPresented.toggle()
                                            }
                                            
                                        }
                                    }
                                    .padding(.top)
                                    .padding(.bottom, 6)
                                    .padding()
                                }
                            }
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
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(AppColors.grey2)
                                    .frame(height: 51)
                                HStack {
                                    Image("bell")
                                        .foregroundColor(AppColors.blue)
                                    Text("Подписка на цену")
                                        .foregroundColor(AppColors.white)
                                        .font(AppFonts.regular16.font)
                                        .multilineTextAlignment(.leading)
                                    Spacer()
                                    Button(action: {
                                        //
                                    }) {
                                        Image("switchOff")
                                            .foregroundColor(AppColors.white)
                                    }
                                }
                                .padding()
                            }
                        }
                    }
                    Spacer()
                }
                .padding()
            }
            .navigationBarHidden(true)
            .sheet(isPresented: $isViewAllTicketsViewPresented) {
                ViewAllTicketsView()
            }
        }
    }
}

//struct ChoosenFlightView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChoosenFlightView()
//    }
//}
