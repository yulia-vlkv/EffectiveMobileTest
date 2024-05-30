//
//  PlaceholderView.swift
//  EffectiveMobileTest
//
//  Created by Iuliia Volkova on 30.05.2024.
//

import SwiftUI

struct PlaceholderView: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.largeTitle)
            .foregroundColor(.white)
    }
}

#Preview {
    PlaceholderView(title: "Некий текст")
}
