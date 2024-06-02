//
//  MusicCardView.swift
//  EffectiveMobileTest
//
//  Created by Iuliia Volkova on 02.06.2024.
//

import SwiftUI

struct MusicCardView: View {
    let card: MusicCardModel

    var body: some View {
        VStack(alignment: .leading) {
            Image(uiImage: UIImage(named: "\(card.id)") ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .cornerRadius(10)

            Text(card.title)
                .font(.headline)
                .foregroundColor(.white)
                .lineLimit(1)
                .truncationMode(.tail)

            Text(card.town)
                .font(.subheadline)
                .foregroundColor(.gray)

            Text("от \(card.price.value.formattedPrice) ₽")
                .font(.subheadline)
                .foregroundColor(.white)
        }
        .frame(width: 150)
    }
}

extension Int {
    var formattedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        return formatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}

struct MusicCardView_Previews: PreviewProvider {
    static var previews: some View {
        let card = MusicCardModel(id: 1, title: "Die Antwoord", town: "Будапешт", price: Price(value: 22264))
        MusicCardView(card: card)
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.black)
    }
}
