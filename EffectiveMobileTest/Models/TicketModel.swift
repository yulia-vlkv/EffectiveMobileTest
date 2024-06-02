//
//  TicketModel.swift
//  EffectiveMobileTest
//
//  Created by Iuliia Volkova on 31.05.2024.
//

import Foundation

struct Ticket: Codable, Identifiable {
    let id: Int
    let badge: String?
    let price: Price
    let providerName: String
    let company: String
    let departure: Location
    let arrival: Location
    let hasTransfer: Bool
    let hasVisaTransfer: Bool
    let luggage: Luggage
    let handLuggage: HandLuggage
    let isReturnable: Bool
    let isExchangable: Bool

    enum CodingKeys: String, CodingKey {
        case id, badge, price, company, departure, arrival, luggage
        case providerName = "provider_name"
        case hasTransfer = "has_transfer"
        case hasVisaTransfer = "has_visa_transfer"
        case handLuggage = "hand_luggage"
        case isReturnable = "is_returnable"
        case isExchangable = "is_exchangable"
    }
}

struct Price: Codable {
    let value: Int
}

struct Location: Codable {
    let town: String
    let date: String
    let airport: String
}

struct Luggage: Codable {
    let hasLuggage: Bool
    let price: Price?

    enum CodingKeys: String, CodingKey {
        case hasLuggage = "has_luggage"
        case price
    }
}

struct HandLuggage: Codable {
    let hasHandLuggage: Bool
    let size: String?

    enum CodingKeys: String, CodingKey {
        case hasHandLuggage = "has_hand_luggage"
        case size
    }
}

struct TicketsResponse: Codable {
    let tickets: [Ticket]
}
