//
//  ChoosenFlightView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 30.05.2024.
//

import SwiftUI

struct ChoosenFlightView: View {
    @Environment(\.dismiss) var dismiss
    let name = ["обратно", "24 фев, сб", "1,эконом", ""]
    let image = ["plus", nil , "human", "Icon"]
    @State private var isViewAllTicketsViewPresented = false
    var body: some View {
        NavigationView {
            ZStack {
                Color(.black)
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
                                        Text("Mинск")
                                            .font(AppFonts.medium16.font)
                                            .foregroundColor(AppColors.white)
                                        Spacer()
                                        Button(action: {
                                            //
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
                                        Text("Сочи")
                                            .font(AppFonts.medium16.font)
                                            .foregroundColor(AppColors.white)
                                        Spacer()
                                        Button(action: {
                                            //
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
                                ForEach(0 ..< 4) { index in
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
                                        Text("Прямые рейсы")
                                            .foregroundColor(AppColors.white)
                                            .font(AppFonts.semibold20.font)
                                            .multilineTextAlignment(.leading)
                                        DirectFlightsCellView()
                                            .padding(.top, 8)
                                        Divider()
                                            .background(.white)
                                        Spacer()
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

struct FilterCellView: View {
    let image: Image?
    let name: Text
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            
            if let image = image {
                            Button(action: {
                                //
                            }) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 16)
                                        .foregroundColor(AppColors.grey3)
                                        .frame(height: 33)
                                    HStack {
                                        image
                                            .frame(width: 15, height: 15)
                                            .foregroundColor(AppColors.white)
                                        name
                                            .italic()
                                            .foregroundColor(AppColors.white)
                                    }
                                    .padding([.leading, .trailing])
                                }
                            }
                        } else {
                            name
                                .italic()
                                .foregroundColor(AppColors.white)
                                .padding([.leading, .trailing])
                        }
            }
        }
}

struct DirectFlightsCellView: View {
    var body: some View {
        Button(action: {
            //
        }) {
            ZStack {
                HStack(alignment: .top) {
                    Circle()
                        .frame(width: 24)
                        .foregroundColor(AppColors.red)
                    VStack(alignment: .leading) {
                        HStack{
                            Text("Уральские авиалинии")
                                .foregroundColor(AppColors.white)
                                .italic()
                            Spacer()
                            HStack {
                                Text("2 390 ₽")
                                Image("arrowRight")
                                
                            }
                            .foregroundColor(AppColors.blue)
                        }
                        Text("07:00 09:10 10:00 11:00 12:00 13:00 12:00")
                            .foregroundColor(AppColors.white)
                            .italic()
                            .lineLimit(1)
                    }
                }
            }
            
        }
    }
}

struct ChoosenFlightView_Previews: PreviewProvider {
    static var previews: some View {
        ChoosenFlightView()
    }
}
