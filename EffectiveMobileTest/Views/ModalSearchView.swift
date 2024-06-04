//
//  ModalSearchView.swift
//  EffectiveMobileTest
//
//  Created by Iuliia Volkova on 30.05.2024.
//


import SwiftUI

struct ModalSearchView: View {
    @Binding var destination: String
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            HStack {
                TextField("Куда - Турция", text: $destination)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .overlay(
                        HStack {
                            Spacer()
                            if !destination.isEmpty {
                                Button(action: {
                                    destination = ""
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 8)
                                }
                            }
                        }
                    )
                    .padding(.horizontal)
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Готово")
                        .foregroundColor(.blue)
                }
                .padding(.trailing)
            }

            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        SearchOptionButton(title: "Сложный маршрут", color: .customGreen) {
                            presentationMode.wrappedValue.dismiss()
                        }
                        SearchOptionButton(title: "Куда угодно", color: .customBlue) {
                            destination = "Куда угодно"
                            presentationMode.wrappedValue.dismiss()
                        }
                        SearchOptionButton(title: "Выходные", color: .customBlue) {
                            presentationMode.wrappedValue.dismiss()
                        }
                        SearchOptionButton(title: "Горящие билеты", color: .customRed) {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading) {
                        Text("Рекомендации")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        
                        RecommendationButton(title: "Стамбул") {
                            destination = "Стамбул"
                            presentationMode.wrappedValue.dismiss()
                        }
                        RecommendationButton(title: "Сочи") {
                            destination = "Сочи"
                            presentationMode.wrappedValue.dismiss()
                        }
                        RecommendationButton(title: "Пхукет") {
                            destination = "Пхукет"
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.top)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct SearchOptionButton: View {
    var title: String
    var color: Color
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundColor(.white)
                .padding()
                .background(color)
                .cornerRadius(10)
        }
        .padding(.horizontal, 2)
    }
}

struct RecommendationButton: View {
    var title: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                Spacer()
            }
        }
    }
}

struct ModalSearchView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }

    struct PreviewWrapper: View {
        @State private var destination: String = ""

        var body: some View {
            ModalSearchView(destination: $destination)
                .previewLayout(.sizeThatFits)
                .padding()
                .background(Color.black)
        }
    }
}
