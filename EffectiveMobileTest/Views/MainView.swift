//
//  MainView.swift
//  EffectiveMobileTest
//
//  Created by Iuliia Volkova on 03.06.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject private var coordinator = Coordinator()

    var body: some View {
        VStack {
            if let currentPage = coordinator.currentPage {
                switch currentPage {
                case .aviaSearch:
                    AviaView()
                        .environmentObject(coordinator)
                case .ticketList:
                    TicketsListView()
                        .environmentObject(coordinator)
                case .placeholder(let title):
                    PlaceholderView(title: title)
                }
            } else {
                AviaView()
                    .environmentObject(coordinator)
            }
            
            Spacer()
            
            TabBar()
                .environmentObject(coordinator)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    MainView()
}
