//
//  CustomTextField.swift
//  EffectiveMobileTest
//
//  Created by Iuliia Volkova on 30.05.2024.
//

import SwiftUI

struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String

    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
            .foregroundColor(.white)
            .keyboardType(.default)
            .disableAutocorrection(true)
            .textInputAutocapitalization(.never)
            .onChange(of: text) { newValue in
                let filtered = newValue.filter { $0.isCyrillic }
                if filtered != newValue {
                    text = filtered
                }
            }
    }
}

extension Character {
    var isCyrillic: Bool {
        return ("А"..."я").contains(self) || self == "ё" || self == "Ё"
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }

    struct PreviewWrapper: View {
        @State private var text: String = "Минск"

        var body: some View {
            CustomTextField(placeholder: "Откуда - Москва", text: $text)
                .previewLayout(.sizeThatFits)
                .padding()
                .background(Color.black)
        }
    }
}
