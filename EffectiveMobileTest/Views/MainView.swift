//
//  MainView.swift
//  EffectiveMobileTest
//
//  Created by Iuliia Volkova on 30.05.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject private var coordinator = Coordinator()

    var body: some View {
        VStack {
            Spacer()
            content
            Spacer()
            tabBar
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }

    @ViewBuilder
    private var content: some View {
        switch coordinator.selectedTab {
        case .avia:
            AviaView()
        case .hotels:
            PlaceholderView(title: "Отели")
        case .koroche:
            PlaceholderView(title: "Короче")
        case .subscriptions:
            PlaceholderView(title: "Подписки")
        case .profile:
            PlaceholderView(title: "Профиль")
        }
    }

    private var tabBar: some View {
        HStack {
            tabBarItem(icon: "airplane", title: "Авиабилеты", tab: .avia)
            tabBarItem(icon: "bed.double.fill", title: "Отели", tab: .hotels)
            tabBarItem(icon: "mappin.and.ellipse", title: "Короче", tab: .koroche)
            tabBarItem(icon: "bell.fill", title: "Подписки", tab: .subscriptions)
            tabBarItem(icon: "person.fill", title: "Профиль", tab: .profile)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
    }

    private func tabBarItem(icon: String, title: String, tab: Coordinator.Tab) -> some View {
        VStack {
            Image(systemName: icon)
                .font(.system(size: 24))
            Text(title)
                .font(.footnote)
        }
        .foregroundColor(coordinator.selectedTab == tab ? Color.blue : Color.white)
        .padding()
        .onTapGesture {
            coordinator.selectedTab = tab
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
