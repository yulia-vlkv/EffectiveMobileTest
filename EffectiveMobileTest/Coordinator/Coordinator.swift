//
//  Coordinator.swift
//  EffectiveMobileTest
//
//  Created by Iuliia Volkova on 30.05.2024.
//

import SwiftUI

class Coordinator: ObservableObject {
    @Published var selectedTab: Tab = .avia

    enum Tab {
        case avia, hotels, koroche, subscriptions, profile
    }
}
