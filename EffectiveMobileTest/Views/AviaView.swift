//
//  AviaView.swift
//  EffectiveMobileTest
//
//  Created by Iuliia Volkova on 30.05.2024.
//

import SwiftUI

struct AviaView: View {
    @State private var departure: String = UserDefaults.standard.string(forKey: "departure") ?? ""
    @State private var destination: String = ""
    @State private var showingModal = false

    var body: some View {
        VStack {
            Text("Поиск дешевых авиабилетов")
                .font(.title)
                .foregroundColor(.white)
                .padding(.top, 50)
            
            VStack(spacing: 16) {
                CustomTextField(placeholder: "Откуда - Москва", text: $departure)
                CustomTextField(placeholder: "Куда - Турция", text: $destination)
                    .onTapGesture {
                        self.showingModal = true
                    }
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .padding(.horizontal)
            
            Spacer()
            
            Text("Музыкально отлететь")
                .font(.title2)
                .foregroundColor(.white)
                .padding(.top, 30)
            
            HStack {
                // Card views go here
            }
            .padding()
            
            Spacer()
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .sheet(isPresented: $showingModal) {
            ModalSearchView(destination: $destination)
        }
        .onDisappear {
            UserDefaults.standard.set(self.departure, forKey: "departure")
        }
    }
}

#Preview {
    AviaView()
}
