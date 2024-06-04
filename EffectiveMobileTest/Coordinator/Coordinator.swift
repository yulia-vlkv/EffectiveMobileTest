//
//  Coordinator.swift
//  EffectiveMobileTest
//
//  Created by Iuliia Volkova on 30.05.2024.
//

import SwiftUI

class Coordinator: ObservableObject {
    enum Tab {
        case avia, hotels, shorterPath, subscriptions, profile
    }
    
    enum Page {
        case aviaSearch, ticketList, placeholder(String)
    }
    
    @Published var selectedTab: Tab = .avia
    @Published var currentPage: Page? = nil
    @Published var showingModal = false
    @Published var destination: String = ""
    
    func showPlaceholder(title: String) {
        currentPage = .placeholder(title)
    }
    
    func showTicketList() {
        currentPage = .ticketList
    }
    
    func showAviaSearch() {
        currentPage = .aviaSearch
    }
}
