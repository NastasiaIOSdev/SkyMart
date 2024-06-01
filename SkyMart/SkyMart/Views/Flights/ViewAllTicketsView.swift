//
//  ViewAllTicketsView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 30.05.2024.
//

import SwiftUI
import Foundation
import Combine

// MARK: - Welcome
struct AllTicketsResponce: Codable {
    let tickets: [Ticket]
}

// MARK: - Ticket
struct Ticket: Codable, Identifiable, Equatable {
   
    let id: Int
    let badge: String?
    let price: Price3
    let providerName, company: String
    let departure, arrival: Arrival
    let hasTransfer, hasVisaTransfer: Bool
    let luggage: Luggage
    let handLuggage: HandLuggage
    let isReturnable, isExchangable: Bool

    enum CodingKeys: String, CodingKey {
        case id, badge, price
        case providerName = "provider_name"
        case company, departure, arrival
        case hasTransfer = "has_transfer"
        case hasVisaTransfer = "has_visa_transfer"
        case luggage
        case handLuggage = "hand_luggage"
        case isReturnable = "is_returnable"
        case isExchangable = "is_exchangable"
    }
    static func == (lhs: Ticket, rhs: Ticket) -> Bool {
           return lhs.id == rhs.id
       }
}

// MARK: - Arrival
struct Arrival: Codable {
    let town: Town
    let date: String
    let airport: Airport
}

enum Airport: String, Codable {
    case aer = "AER"
    case vko = "VKO"
}

enum Town: String, Codable {
    case москва = "Москва"
    case сочи = "Сочи"
}

// MARK: - HandLuggage
struct HandLuggage: Codable {
    let hasHandLuggage: Bool
    let size: String?

    enum CodingKeys: String, CodingKey {
        case hasHandLuggage = "has_hand_luggage"
        case size
    }
}

// MARK: - Luggage
struct Luggage: Codable {
    let hasLuggage: Bool
    let price: Price3?

    enum CodingKeys: String, CodingKey {
        case hasLuggage = "has_luggage"
        case price
    }
}

// MARK: - Price
struct Price3: Codable {
    let value: Int
}

class NetworkManager3 {
    static let shared = NetworkManager3()
    private init() {}
    func fetchAllTickets() -> AnyPublisher<[Ticket], Error> {
        guard let url = URL(string: "https://run.mocky.io/v3/670c3d56-7f03-4237-9e34-d437a9e56ebf") else {
        return Fail(error: NSError(domain: "Invalid URL", code: -1, userInfo: nil))
                .eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data}
            .decode(type: AllTicketsResponce.self, decoder: JSONDecoder())
            .map { $0.tickets}
            .eraseToAnyPublisher()
    }
}

class AllTicketsViewModel: ObservableObject {
    @Published var allTicketsOffers: [Ticket] = []
    private var cancellables: Set<AnyCancellable> = []
    
    func fetchAllFlaightsOffers() {
        NetworkManager3.shared.fetchAllTickets()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Error: \(error)")
                case .finished:
                    print("Закончилась загрузка билетов")
                }
            },
                  receiveValue: { [weak self] tickets in
                self?.allTicketsOffers = tickets
            })
            .store(in: &cancellables)
    }
}

struct ViewAllTicketsView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = AllTicketsViewModel()
    @State private var isTicketScreenViewPresented = false
    var body: some View {
        NavigationView {
            ZStack {
                Color(.black)
                    .ignoresSafeArea()
                VStack(spacing: 16) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 0)
                            .foregroundColor(AppColors.grey2)
                            .frame(height: 56)
                        HStack {
                            Button(action: {
                                dismiss()
                            }) {
                                Image("arrowLeft")
                                    .foregroundColor(AppColors.blue)
                                    .padding(.leading)
                            }
                            VStack(alignment: .leading, spacing: 4) {
                                HStack{
                                    Text("Москва-Сочи")
                                        .font(AppFonts.semibold16.font)
                                        .foregroundColor(AppColors.white)
                                    Spacer()
                                }
                                HStack{
                                    Text("Сочи")
                                        .font(AppFonts.medium16.font)
                                        .foregroundColor(AppColors.white)
                                    Spacer()
                                }
                            }
                        }
                    }
                    .padding([.leading, .trailing])
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 4) {
                            ForEach(viewModel.allTicketsOffers) { ticket in
                                Button(action: {
                                    //
                                }) {
                                    AllTicketsRowView (
                                        badge: Text(ticket.badge ?? " "),
                                        price: Text(PriceFormatter.shared.string(from: ticket.price.value)),
                                        depatureTime: Text(DateFormatter.formatTime(from: ticket.departure.date, format: "HH:mm")),
                                        depatureAirport: Text(ticket.departure.airport.rawValue),
                                        arivalTime: Text(DateFormatter.formatTime(from: ticket.arrival.date, format: "HH:mm")),
                                        arivalAirport: Text(ticket.arrival.airport.rawValue),
                                        travelTime: Text(DateFormatter.calculateTimeTraveling(depatureDate: ticket.departure.date, arrivalDate: ticket.arrival.date)),
                                        badgeColor: ticket.badge != nil ? .blue : nil
                                    )
                                    .onTapGesture {
                                        isTicketScreenViewPresented.toggle()
                                    }
                                }
                            }
                        }
                        .padding(0)
                    }
                    .onAppear {
                        viewModel.fetchAllFlaightsOffers()
                    }
                    Spacer()
                    
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
            .navigationBarHidden(true)
            .sheet(isPresented: $isTicketScreenViewPresented) {
                TicketScreenView()
            }
        }
    }
}

struct ViewAllTicketsView_Previews: PreviewProvider {
    static var previews: some View {
        ViewAllTicketsView()
    }
}

struct AllTicketsRowView: View {
    let badge: Text
    let price: Text
    let depatureTime: Text
    let depatureAirport: Text
    let arivalTime: Text
    let arivalAirport: Text
    let travelTime: Text
    let badgeColor: Color?
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(AppColors.grey1)
                .padding([.leading, .trailing], 16)
                .frame(height: 120)
            if let badge = badge {
                ZStack {
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundColor(badgeColor)
                        .opacity(badgeColor != nil ? 1 : 0)
                        .frame(width: 143, height: 31)
                    badge
                        .foregroundColor(AppColors.white)
                        .italic()
                }
                .padding(.leading)
                .padding(.bottom, 115)
            } else {
                EmptyView()
            }
            
            VStack(alignment: .leading) {
                HStack{
                    price
                    Text("₽")
                }
                .padding(.leading)
                .foregroundColor(AppColors.white)
                .font(AppFonts.semibold22.font)
                HStack {
                    HStack {
                        Circle()
                            .frame(width: 24)
                            .foregroundColor(AppColors.red)
                        
                    }
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            depatureTime
                                .foregroundColor(AppColors.white)
                                .lineLimit(1)
                                .font(AppFonts.regularItalic14.font)
                            depatureAirport
                                .foregroundColor(AppColors.grey6)
                                .font(AppFonts.regularItalic14.font)
                                
                        }
                        Image("line")
                            .foregroundColor(AppColors.grey6)
                            .padding(.top, 9)
                        VStack(alignment: .leading) {
                            arivalTime
                                .foregroundColor(AppColors.white)
                                .lineLimit(1)
                                .font(AppFonts.regularItalic14.font)
                            arivalAirport
                                .foregroundColor(AppColors.grey6)
                                .font(AppFonts.regularItalic14.font)
                        }
                        VStack(alignment: .leading) {
                            HStack(spacing: 0) {
                                travelTime
                                Text("в пути /")
                                Text(" Без пересадок")
                                   
                            }
                            .foregroundColor(AppColors.white)
                            .font(AppFonts.regular14.font)
                            .lineLimit(1)
                        }
                        .padding(.leading, 7)
                        Spacer()
                    }
                }
                .padding([.leading, .trailing])
            }
            .padding()
        }
    }
}
