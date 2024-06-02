//
//  MenuBarButton.swift
//  EffectiveMobileTest
//
//  Created by Iuliia Volkova on 31.05.2024.
//

import SwiftUI

struct MenuBarButton: View {
    var tab: Coordinator.Page
    var isActiveTab: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(iconName)
                    .font(.system(size: 20))
                    .foregroundColor(isActiveTab ? Color.blue : Color.gray)
                Text(tabTitle)
                    .font(FontStyles.tabText)
                    .foregroundColor(isActiveTab ? Color.blue : Color.gray)
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    private var iconName: String {
        switch tab {
        case .avia:
            return "avia"
        case .hotels:
            return "hotel"
        case .koroche:
            return "pin"
        case .subscriptions:
            return "subscription"
        case .profile:
            return "profile"
        }
    }
    
    private var tabTitle: String {
        switch tab {
        case .avia:
            return "Авиабилеты"
        case .hotels:
            return "Отели"
        case .koroche:
            return "Короче"
        case .subscriptions:
            return "Подписки"
        case .profile:
            return "Профиль"
        }
    }
}

#Preview {
    MenuBarButton(tab: .avia, isActiveTab: true) {
        // action
    }
}
