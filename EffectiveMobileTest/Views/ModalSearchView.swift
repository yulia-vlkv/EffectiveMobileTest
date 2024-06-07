//
//  ModalSearchView.swift
//  EffectiveMobileTest
//
//  Created by Iuliia Volkova on 30.05.2024.
//


import SwiftUI

struct ModalSearchView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var departure: String
    @Binding var destination: String

    var body: some View {
        VStack {
            Capsule()
                .fill(Color.gray)
                .frame(width: 40, height: 5)
                .padding(.top, 10)
                .padding(.bottom, 10)
            
            CustomTextField(
                placeholderDeparture: "Откуда - Москва",
                placeholderDestination: "Куда - Турция",
                textDeparture: $departure,
                textDestination: $destination,
                isModal: true
            )
            .padding()
            .background(.customGrey2)
            .cornerRadius(10)
            .padding(.horizontal)
            
            Spacer()
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    ModalSearchView(departure: .constant("Минск"), destination: .constant("Сочи"))
}
