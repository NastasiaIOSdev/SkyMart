//
//  ChoosenFlightView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 30.05.2024.
//

import SwiftUI
import Foundation
import Combine

// MARK: - Welcome
struct TicketsResponse: Codable {
    let ticketsOffers: [TicketsOffer]
    
    enum CodingKeys: String, CodingKey {
        case ticketsOffers = "tickets_offers"
    }
}

// MARK: - TicketsOffer
struct TicketsOffer: Codable, Identifiable {
    let id: Int
    let title: String
    let time: [String]
    let price: Price2
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case time = "time_range"
        case price
    }
}
// MARK: - Price
struct Price2: Codable {
    let value: Int
}

class NetworkManager2 {
    static let shared = NetworkManager2()
    private init() {}
    func fetchTickets() -> AnyPublisher<[TicketsOffer], Error> {
        guard let url = URL(string: "https://run.mocky.io/v3/7e55bf02-89ff-4847-9eb7-7d83ef884017") else {
            return Fail(error: NSError(domain: "Invalid URL", code: -1, userInfo: nil))
                .eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data}
            .decode(type: TicketsResponse.self, decoder: JSONDecoder())
            .map { $0.ticketsOffers}
            .eraseToAnyPublisher()
    }
}

class TicketsViewModel: ObservableObject {
    @Published var ticketsOffers: [TicketsOffer] = []
    private var cancellables: Set<AnyCancellable> = []
    
    func fetchTicketsOffers() {
        NetworkManager2.shared.fetchTickets()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] tickets in
                self?.ticketsOffers = tickets
            })
            .store(in: &cancellables)
    }
}

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

struct ChoosenFlightView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var cityDeparture: String
    @Binding var cityArrival: String
    @StateObject var viewModel = TicketsViewModel()
    
    @State private var isViewAllTicketsViewPresented = false
    @State private var isDatePickerModalPresented = false
    @State private var selectedDate = Date()
    @State private var timeArrival = Date()
    @State private var arrivalDateButtonText = "+ обратно"

    var name: [String] {
        ["обратно",DateFormatter.currentDateFormatter() , "1,эконом", ""]
    }
    let image = ["plus", nil , "human", "Icon"]
  
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
                                        Text(cityArrival)
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
                                ForEach(1 ..< 4) { index in
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
    let title: Text
    let time: Text
    let price: Text
    var body: some View {
        Button(action: {
            //
        }) {
            ZStack {
                HStack(alignment: .top) {
                    Circle()
                        .frame(width: 24, height: 24)
                        .foregroundColor(AppColors.white)
                    VStack(alignment: .leading) {
                        HStack{
                            title
                                .foregroundColor(AppColors.white)
                                .italic()
                            Spacer()
                            HStack {
                                price
                                Text("₽")
                                Image("arrowRight")
                            }
                            .font(AppFonts.medium16.font)
                            .foregroundColor(AppColors.blue)
                        }
                        time
                            .foregroundColor(AppColors.white)
                            .font(AppFonts.regular14.font)
                            .lineLimit(1)
                    }
                }
            }
            .padding(.top, 4)
        }
    }
}

//struct ChoosenFlightView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChoosenFlightView()
//    }
//}
