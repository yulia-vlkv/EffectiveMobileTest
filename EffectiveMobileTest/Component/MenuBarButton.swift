//
//  MenuBarButton.swift
//  EffectiveMobileTest
//
//  Created by Iuliia Volkova on 31.05.2024.
//

import SwiftUI

struct TabBarButton: View {
    @EnvironmentObject var coordinator: Coordinator
    var title: String
    var iconName: String
    var tab: Coordinator.Tab
    
    var body: some View {
        Button(action: {
            coordinator.selectedTab = tab
            switch tab {
            case .avia:
                coordinator.showAviaSearch()
            case .hotels:
                coordinator.showPlaceholder(title: "Отели")
            case .shorterPath:
                coordinator.showPlaceholder(title: "Короче")
            case .subscriptions:
                coordinator.showPlaceholder(title: "Подписки")
            case .profile:
                coordinator.showPlaceholder(title: "Профиль")
            }
        }) {
            VStack(spacing: 4) {
                Image(iconName)
                    .font(.tabText())
                Text(title)
                    .font(.tabText())
                    .lineLimit(1)
            }
            .padding(.vertical, 8)
            .foregroundColor(coordinator.selectedTab == tab ? .customBlue: .customGrey6)
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    TabBarButton(title: "Авиабилеты", iconName: "avia", tab: .avia)
        .environmentObject(Coordinator())
}
