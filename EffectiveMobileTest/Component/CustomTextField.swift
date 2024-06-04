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
    var onDestinationTap: () -> Void
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.customGrey3)
                .frame(height: 90)
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
            
            HStack {
                Image("magnifyingglass")
                    .foregroundColor(.customGrey5)
                    .padding(.leading, 10)
                
                VStack(alignment: .leading) {
                    TextField("",
                              text: $textDeparture,
                              prompt: Text(placeholderDeparture)
                        .font(.buttonText1())
                        .foregroundColor(.customGrey5)
                    )
                    .foregroundColor(.customWhite)
                    .padding(.leading, 10)
                    .font(.buttonText1())
                    .onChange(of: textDeparture) { newValue in
                        textDeparture = newValue.filter { "АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя ".contains($0) }
                    }
                    
                    Divider()
                        .background(Color.customGrey5)
                    
                    TextField("",
                              text: $textDestination,
                              prompt: Text(placeholderDestination)
                        .font(.buttonText1())
                        .foregroundColor(.customGrey5)
                    )
                    .foregroundColor(.customWhite)
                    .padding(.leading, 10)
                    .font(.buttonText1())
                    .onTapGesture {
                        onDestinationTap()
                    }
                    .onChange(of: textDeparture) { newValue in
                        textDeparture = newValue.filter { "АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдеёжзийклмнопрстуфхцчшщъыьэюя ".contains($0) }
                    }
                }
            }
            .padding(.horizontal, 10)
        }
    }
}

#Preview {
    AviaView()
        .environmentObject(Coordinator())
}
