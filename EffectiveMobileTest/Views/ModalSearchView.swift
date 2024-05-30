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
                                    .padding()
                            }
                        }
                    }
                )
                .padding()

            HStack {
                SearchOptionButton(title: "Сложный маршрут", color: .customGreen, action: {
                    presentationMode.wrappedValue.dismiss()
                })
                SearchOptionButton(title: "Куда угодно", color: .customBlue, action: {
                    destination = "Куда угодно"
                })
                SearchOptionButton(title: "Выходные", color: .customBlue, action: {
                    presentationMode.wrappedValue.dismiss()
                })
                SearchOptionButton(title: "Горящие билеты", color: .customRed, action: {
                    presentationMode.wrappedValue.dismiss()
                })
            }
            .padding()

            List {
                SearchSuggestion(title: "Стамбул", subtitle: "Популярное направление", imageName: "istanbul")
                SearchSuggestion(title: "Сочи", subtitle: "Популярное направление", imageName: "sochi")
                SearchSuggestion(title: "Пхукет", subtitle: "Популярное направление", imageName: "phuket")
            }
            .background(Color.black)
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
            VStack {
                Circle()
                    .fill(color)
                    .frame(width: 50, height: 50)
                    .overlay(
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.white)
                            .font(.title)
                    )
                Text(title)
                    .font(.footnote)
                    .foregroundColor(.white)
            }
        }
        .padding()
    }
}

struct SearchSuggestion: View {
    var title: String
    var subtitle: String
    var imageName: String

    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(8)
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
