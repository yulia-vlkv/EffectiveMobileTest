//
//  AviaView.swift
//  EffectiveMobileTest
//
//  Created by Iuliia Volkova on 30.05.2024.
//

import SwiftUI

struct AviaView: View {
    @StateObject private var coordinator = Coordinator()
    @State private var musicCards: [MusicCardModel] = []
    @State private var isLoading = true
    @State private var errorMessage: String?
    @State private var destination: String = ""
    @State private var departure: String = UserDefaults.standard.string(forKey: "departure") ?? ""
    @State private var showingModal = false
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Поиск дешевых авиабилетов")
                        .font(.title1())
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 50)
                        .padding(.horizontal, 30)
                    
                    CustomTextField(
                        placeholderDeparture: "Откуда - Москва",
                        placeholderDestination: "Куда - Турция",
                        textDeparture: $departure,
                        textDestination: $destination,
                        onDestinationTap: {
                            self.showingModal = true
                        }
                    )
                    .onDisappear {
                        UserDefaults.standard.set(departure, forKey: "departure")
                    }
                    .padding()
                    .background(.customGrey2)
                    .cornerRadius(10)
                    
                    Text("Музыкально отлететь")
                        .font(.title1())
                        .foregroundColor(.white)
                        .padding(.top, 30)
                    
                    if isLoading {
                        ProgressView("Loading...")
                            .foregroundColor(.white)
                    } else if let errorMessage = errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                    } else {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(musicCards) { card in
                                    MusicCardView(card: card)
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
            
            TabBar()
                .environmentObject(coordinator)
        }
        .onAppear {
            fetchMusicCards()
        }
    }
    
    private func fetchMusicCards() {
        NetworkService.shared.fetchMusicCards { result in
            DispatchQueue.main.async {
                isLoading = false
                switch result {
                case .success(let response):
                    musicCards = response.offers
                case .failure(let error):
                    errorMessage = error.localizedDescription
                }
            }
        }
    }
}

#Preview {
    AviaView()
}
