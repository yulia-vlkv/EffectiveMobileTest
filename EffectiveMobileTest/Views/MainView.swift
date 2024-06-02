//
//  MainView.swift
//  EffectiveMobileTest
//
//  Created by Iuliia Volkova on 30.05.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject private var coordinator = Coordinator()
    @State private var musicCards: [MusicCardModel] = []
    @State private var isLoading = true
    @State private var errorMessage: String?

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Поиск дешевых авиабилетов")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.top, 50)

                    VStack(spacing: 16) {
                        CustomTextField(placeholder: "Откуда - Москва", text: .constant(""))
                        CustomTextField(placeholder: "Куда - Турция", text: .constant(""))
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal)

                    Text("Музыкально отлететь")
                        .font(.title2)
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
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.bottom, 16)
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))

            MenuBar()
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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
