//
//  MusicCardModel.swift
//  EffectiveMobileTest
//
//  Created by Iuliia Volkova on 31.05.2024.
//

import Foundation

struct MusicCardModel: Codable, Identifiable {
    let id: Int
    let title: String
    let town: String
    let price: Price
}

struct MusicCardsResponse: Codable {
    let offers: [MusicCardModel]
}
