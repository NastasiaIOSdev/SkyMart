//
//  FlightView.swift
//  SkyMart
//
//  Created by Анастасия Ларина on 30.05.2024.
//

import SwiftUI
import Foundation
import Combine

// MARK: - Welcome
struct OffersResponse: Codable {
    let offers: [Offer]
}

// MARK: - Offer
struct Offer: Codable, Identifiable {
    let id: Int
    let name: String
    let city: String
    let price: Price

    enum CodingKeys: String, CodingKey {
        case id, name = "title", city = "town", price
    }
}

// MARK: - Price
struct Price: Codable {
    let value: Int
}

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    func fetchOffers() -> AnyPublisher<[Offer], Error> {
        guard let url = URL(string: "https://run.mocky.io/v3/214a1713-bac0-4853-907c-a1dfc3cd05fd") else {
        return Fail(error: NSError(domain: "Invalid URL", code: -1, userInfo: nil))
                .eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data}
            .decode(type: OffersResponse.self, decoder: JSONDecoder())
            .map { $0.offers}
            .eraseToAnyPublisher()
    }
}

class FlaightsViewModel: ObservableObject {
    @Published var flightOffers: [Offer] = []
    private var cancellables: Set<AnyCancellable> = []
    
    func fetchFlightsOffers() {
        NetworkManager.shared.fetchOffers()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] offers in
                self?.flightOffers = offers
            })
            .store(in: &cancellables)
    }
}

struct FlightsView: View {
    @State private var isShowingModal = false
    @StateObject var viewModel = FlaightsViewModel()
    var body: some View {
        NavigationStack{
            ZStack {
                Color.black
                    .ignoresSafeArea()
                ScrollView (.vertical, showsIndicators: false) {
                    VStack {
                        VStack(spacing: 38){
                            Text("Поиск дешевых\n  авиабилетов")
                                .font(AppFonts.semibold22.font)
                                .foregroundColor(AppColors.white)
                            VStack(alignment: .leading, spacing: 32) {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 16)
                                        .foregroundColor(AppColors.grey3)
                                        .frame(height: 122)
                                    RoundedRectangle(cornerRadius: 16)
                                        .foregroundColor(AppColors.grey4)
                                        .frame(height: 95)
                                        .padding()
                                        .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
                                    HStack {
                                        Image("loop")
                                            .foregroundColor(AppColors.grey6)
                                            .padding(.leading)
                                        VStack(alignment: .leading) {
                                            Text("Mинск")
                                                .font(AppFonts.medium16.font)
                                                .foregroundColor(AppColors.white)
                                            Divider()
                                                .background(AppColors.grey6)
                                            Button(action: {
                                                isShowingModal.toggle()
                                            }) {
                                                Text("Куда - Турция")
                                                    .font(AppFonts.medium16.font)
                                                    .foregroundColor(AppColors.grey6)
                                            }
                                        }
                                        .padding()
                                        .sheet(isPresented: $isShowingModal) {
                                            SearchCountryView()
                                        }
                                    }
                                    .padding()
                                }
                                Text("Музыкально отлететь")
                                    .font(AppFonts.semibold22.font)
                                    .foregroundColor(AppColors.white)
                            }
                        }
                        .padding()
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack(spacing: 67) {
                                ForEach(viewModel.flightOffers) { offer in
                                    CollectionCellView(image: Image("image_\(offer.id)"), name: Text(offer.name), city: Text(offer.city), price: Text("\(offer.price.value)"))
                                }
                            }
                            .padding(.leading, 16)
                        }
                        .onAppear {
                            viewModel.fetchFlightsOffers()
                        }
                        Spacer()
                    }
                    .padding(.top, 26)
                }
            }
        }
    }
}

struct CollectionCellView: View {
    let image: Image
    let name: Text
    let city: Text
    let price: Text
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            image
                .resizable()
                .frame(width: 132, height: 132)
                .cornerRadius(16)
            name
                .font(AppFonts.semibold16.font)
                .foregroundColor(AppColors.white)
            city
                .font(AppFonts.regular14.font)
                .foregroundColor(AppColors.white)
            HStack{
                Image("airplane")
                    .foregroundColor(AppColors.white)
                    .frame(width: 17)
                Text("от")
                    .font(AppFonts.regular14.font)
                    .foregroundColor(AppColors.white)
                price
                    .font(AppFonts.regular14.font)
                    .foregroundColor(AppColors.white)
                Text("₽")
                    .font(AppFonts.regular14.font)
                    .foregroundColor(AppColors.white)
            }
        }
        .frame(width: 132, height: 213)
    }
}

struct FlightsView_Previews: PreviewProvider {
    static var previews: some View {
        FlightsView()
    }
}
