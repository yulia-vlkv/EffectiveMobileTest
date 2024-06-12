//
//  CustomTextField.swift
//  EffectiveMobileTest
//
//  Created by Iuliia Volkova on 30.05.2024.
//

import SwiftUI

extension String {
    func filterCyrillic() -> String {
        return self.filter { $0.isCyrillic }
    }
}

extension Character {
    var isCyrillic: Bool {
        return self >= "\u{0400}" && self <= "\u{04FF}"
    }
}

struct CustomTextField: View {
    var placeholderDeparture: String
    var placeholderDestination: String
    @Binding var textDeparture: String
    @Binding var textDestination: String
    var isModal: Bool
    var onSwitch: (() -> Void)? = nil
    var onClearDestination: (() -> Void)? = nil
    
    var body: some View {
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
                VStack(spacing: 10)  {
                    HStack {
                        TextField("",
                                  text: Binding(
                                    get: { textDeparture },
                                    set: { textDeparture = $0.filterCyrillic() }
                                  ),
                                  prompt: Text(placeholderDeparture)
                            .font(.buttonText1())
                            .foregroundColor(.customGrey5)
                        )
                        .foregroundColor(.customWhite)
                        .padding(.leading, 10)
                        .font(.buttonText1())
                        .multilineTextAlignment(.leading)
                        if !textDestination.isEmpty && !textDeparture.isEmpty {
                            Image(systemName: "arrow.up.arrow.down")
                                .foregroundColor(.customGrey5)
                                .padding(.trailing, 10)
                                .onTapGesture {
                                    let temp = textDeparture
                                    textDeparture = textDestination
                                    textDestination = temp
                                }
                        }
                    }
                    Divider()
                        .frame(height: 1)
                        .background(.customGrey5)
                        .padding(.horizontal, 10)
                    HStack {
                        TextField("",
                                  text: Binding(
                                    get: { textDestination },
                                    set: { textDestination = $0.filterCyrillic() }
                                  ),
                                  prompt: Text(placeholderDestination)
                            .font(.buttonText1())
                            .foregroundColor(.customGrey5)
                        )
                        .foregroundColor(.customWhite)
                        .padding(.leading, 10)
                        .font(.buttonText1())
                        .multilineTextAlignment(.leading)
                        if !textDestination.isEmpty && !textDeparture.isEmpty {
                            Image(systemName: "xmark")
                                .foregroundColor(.customGrey5)
                                .padding(.trailing, 10)
                                .onTapGesture {
                                    textDestination = ""
                                }
                        }
                    }
                }
                .padding(.vertical, 10)
            }
        } else {
            VStack(spacing: 10) {
                HStack {
                    Image(systemName: "airplane")
                        .foregroundColor(.customGrey5)
                        .padding(.leading, 10)
                    TextField("",
                              text: Binding(
                                get: { textDeparture },
                                set: { textDeparture = $0.filterCyrillic() }
                              ),
                              prompt: Text(placeholderDeparture)
                        .font(.buttonText1())
                        .foregroundColor(.customGrey5)
                    )
                    .foregroundColor(.customWhite)
                    .padding(.leading, 10)
                    .font(.buttonText1())
                    .multilineTextAlignment(.leading)
                }
                Divider()
                    .frame(height: 1)
                    .background(.customGrey5)
                    .padding(.horizontal, 10)
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.customGrey5)
                        .padding(.leading, 10)
                    TextField("",
                              text: Binding(
                                get: { textDestination },
                                set: { textDestination = $0.filterCyrillic() }
                              ),
                              prompt: Text(placeholderDestination)
                        .font(.buttonText1())
                        .foregroundColor(.customGrey5)
                    )
                    .foregroundColor(.customWhite)
                    .padding(.leading, 10)
                    .font(.buttonText1())
                    .multilineTextAlignment(.leading)
                    if !textDestination.isEmpty {
                        Image(systemName: "xmark")
                            .foregroundColor(.white.opacity(0.8))
                            .padding(.trailing, 10)
                            .onTapGesture {
                                textDestination = ""
                            }
                    }
                }
            }
            .padding(.vertical, 10)
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(placeholderDeparture: "Откуда", placeholderDestination: "Куда", textDeparture: .constant("Москва"), textDestination: .constant("Сочи"), isModal: false)
    }
}
