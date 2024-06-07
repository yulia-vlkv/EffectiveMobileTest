//
//  CustomTextField.swift
//  EffectiveMobileTest
//
//  Created by Iuliia Volkova on 30.05.2024.
//

import SwiftUI

struct CustomTextField: View {
    var placeholderDeparture: String
    var placeholderDestination: String
    @Binding var textDeparture: String
    @Binding var textDestination: String
    var isModal: Bool
    var onSwitch: (() -> Void)? = nil
    var onClearDestination: (() -> Void)? = nil
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.customGrey3)
                .frame(height: 90)
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
            
            if !isModal {
                HStack {
                    if !textDestination.isEmpty && !textDeparture.isEmpty {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.customGrey5)
                            .padding(.leading, 10)
                    } else {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.customGrey5)
                            .padding(.leading, 10)
                    }
                    VStack {
                        HStack {
                            TextField("",
                                      text: $textDeparture,
                                      prompt: Text(placeholderDeparture)
                                .font(.buttonText1())
                                .foregroundColor(.customGrey5)
                            )
                            .foregroundColor(.customWhite)
                            .padding(.leading, 10)
                            .font(.buttonText1())
                            if !textDestination.isEmpty && !textDeparture.isEmpty {
                                Image(systemName: "arrow.up.arrow.down")
                                    .foregroundColor(.customGrey5)
                                    .padding(.leading, 10)
                            }
                        }
                        Divider()
                        HStack {
                            TextField("",
                                      text: $textDestination,
                                      prompt: Text(placeholderDestination)
                                .font(.buttonText1())
                                .foregroundColor(.customGrey5)
                            )
                            .foregroundColor(.customWhite)
                            .padding(.leading, 10)
                            .font(.buttonText1())
                            if !textDestination.isEmpty && !textDeparture.isEmpty {
                                Image(systemName: "xmark")
                                    .foregroundColor(.customGrey5)
                                    .padding(.leading, 10)
                            }
                        }
                    }
                }
            } else {
                VStack {
                    HStack {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.customGrey5)
                            .padding(.leading, 10)
                        TextField("",
                                  text: $textDeparture,
                                  prompt: Text(placeholderDeparture)
                            .font(.buttonText1())
                            .foregroundColor(.customGrey5)
                        )
                        .foregroundColor(.customWhite)
                        .padding(.leading, 10)
                        .font(.buttonText1())
                    }
                    Divider()
                    HStack {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.customGrey5)
                            .padding(.leading, 10)
                        TextField("",
                                  text: $textDestination,
                                  prompt: Text(placeholderDestination)
                            .font(.buttonText1())
                            .foregroundColor(.customGrey5)
                        )
                        .foregroundColor(.customWhite)
                        .padding(.leading, 10)
                        .font(.buttonText1())
                        Image(systemName: "arrow.left")
                            .foregroundColor(.customGrey5)
                            .padding(.trailing, 10)
                    }
                }
            }
        }
    }
}



#Preview {
    CustomTextField(placeholderDeparture: "Откуда", placeholderDestination: "Куда", textDeparture: .constant("Москва"), textDestination: .constant("Сочи"), isModal: false)
}
