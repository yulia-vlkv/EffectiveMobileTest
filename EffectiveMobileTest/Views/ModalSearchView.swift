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
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.customGrey3)
                    .frame(height: 90)
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                
                CustomTextField(
                    placeholderDeparture: "Откуда - Москва",
                    placeholderDestination: "Куда - Турция",
                    textDeparture: $departure,
                    textDestination: $destination,
                    isModal: true
                )
            }
            .padding(.vertical, 32)
            .padding(.horizontal, 16)
            
            HStack {
                Button(action: {}) {
                    VStack {
                        Image(systemName: "command")
                            .foregroundColor(.white)
                            .padding()
                        Text("Сложный\nмаршрут")
                            .foregroundColor(.white)
                            .font(.footnote)
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: 70, height: 70)
                    .background(Color.green)
                    .cornerRadius(10)
                }
                Button(action: {}) {
                    VStack {
                        Image(systemName: "globe")
                            .foregroundColor(.white)
                            .padding()
                        Text("Куда\nугодно")
                            .foregroundColor(.white)
                            .font(.footnote)
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: 70, height: 70)
                    .background(Color.blue)
                    .cornerRadius(10)
                }
                Button(action: {}) {
                    VStack {
                        Image(systemName: "calendar")
                            .foregroundColor(.white)
                            .padding()
                        Text("Выходные")
                            .foregroundColor(.white)
                            .font(.footnote)
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: 70, height: 70)
                    .background(Color.blue)
                    .cornerRadius(10)
                }
                Button(action: {}) {
                    VStack {
                        Image(systemName: "flame")
                            .foregroundColor(.white)
                            .padding()
                        Text("Горячие\nбилеты")
                            .foregroundColor(.white)
                            .font(.footnote)
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: 70, height: 70)
                    .background(Color.red)
                    .cornerRadius(10)
                }
            }
            .padding()
            
            
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.customGrey3)
                    .frame(height: 216)
                    .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                
                VStack(alignment: .leading, spacing: 15) {
                    ForEach([("Стамбул", "istanbul"), ("Сочи", "sochi"), ("Пхукет", "phuket")], id: \.0) { city, imageName in
                        VStack {
                            HStack {
                                Image(imageName)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .cornerRadius(10)
                                VStack(alignment: .leading) {
                                    Text(city)
                                        .foregroundColor(.customWhite)
                                        .font(.title3())
                                    Text("Популярное направление")
                                        .foregroundColor(.customGrey5)
                                        .font(.text2())
                                }
                                Spacer()
                            }
                            Divider()
                                .frame(height: 1)
                                .background(.customGrey5)
                        }
                        .padding(.horizontal, 16)
                    }
                }
            }
            .padding(.vertical, 32)
            .padding(.horizontal, 16)
            
            Spacer()
        }
        .background(Color.customGrey2.edgesIgnoringSafeArea(.all))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ModalSearchView(departure: .constant("Минск"), destination: .constant("Турция"))
    }
}
