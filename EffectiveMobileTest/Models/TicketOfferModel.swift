//
//  TicketOfferModel.swift
//  EffectiveMobileTest
//
//  Created by Iuliia Volkova on 31.05.2024.
//

import Foundation


struct TicketOffer: Codable, Identifiable {
    let id: Int
    let title: String
    let timeRange: [String]
    let price: Price

    enum CodingKeys: String, CodingKey {
        case id, title, price
        case timeRange = "time_range"
    }
}

struct TicketOffersResponse: Codable {
    let ticketsOffers: [TicketOffer]

    enum CodingKeys: String, CodingKey {
        case ticketsOffers = "tickets_offers"
    }
}
