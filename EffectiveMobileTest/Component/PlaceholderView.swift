//
//  PlaceholderView.swift
//  EffectiveMobileTest
//
//  Created by Iuliia Volkova on 30.05.2024.
//

import SwiftUI

struct PlaceholderView: View {
    var title: String
    
    var body: some View {
        VStack {
            Spacer()
            Text(title)
                .font(.title)
                .foregroundColor(.white)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    PlaceholderView(title: "Некий текст")
}
